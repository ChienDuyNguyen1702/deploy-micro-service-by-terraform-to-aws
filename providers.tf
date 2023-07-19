terraform {
  backend "s3" {
    bucket = "github-oidc-terraform-aws-tfstates-chiennd1702"
    key    = "infra.tfstate"
    region = "ap-southeast-1"
  }
}
