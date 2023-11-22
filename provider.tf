terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.16.0"
    }
  }
}
provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region     = var.region
}
