output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
output "instance_image_id"{
    description = "Image ID of the EC2 instance"
    value = aws_instance.app_server.ami
}
output "volume_EBS_id"{
    description = "Volume EBS ID of the EC2 instance"
    value = aws_ebs_volume.app_server.id
}