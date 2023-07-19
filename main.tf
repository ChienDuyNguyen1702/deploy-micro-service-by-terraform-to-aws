terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "project_information" {
  type = map(string)
  default = {
    region = "ap-southeast-1"
    ami   = "ami-0df7a207adb9748c7" // ubuntu 22.04 lts
    itype = "t2.medium"
    publicip     = true
    keyname      = "chiennd"
    secgroupname = "launch-wizard-2"
  }
}

provider "aws" {
  region = lookup(var.project_information, "region")
}

resource "aws_instance" "app_server" {
  ami           = lookup(var.project_information, "ami")
  instance_type = lookup(var.project_information, "itype")
  associate_public_ip_address = lookup(var.project_information, "publicip")
  key_name                    = lookup(var.project_information, "keyname")
  user_data                   = "${file("./instanceAWS/userdata.sh")}"
  user_data_replace_on_change = true
  vpc_security_group_ids = [aws_security_group.KTPM_BMD_VDH-sg.id]
  tags = {
    Name        = "WebServer"
    Environment = "DEV"
    OS          = "UBUNTU"
    Managed     = "IAC"
  }

}
resource "aws_ebs_volume" "app_server" {
  availability_zone = "ap-southeast-1a"
  size              = 8
  tags = {
    Name = "KTPM_BMD_VDH-EBS-volume"
  }
}
# resource "aws_volume_attachment" "ebs_att" {
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.app_server.id
#   instance_id = aws_instance.app_server.id
# }
