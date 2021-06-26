# https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
  required_version = ">= 0.13"
  backend "s3" {
    profile = "ProfileNamePlaceHolder-TODO"
    region  = "us-east-1"
    key     = "cloud-networks/kreuzwerker/docker/terraform.tfstate"
    bucket  = "ps-networks-svc-terraform"
  }
}
