terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


backend "s3" {
    bucket = "timing-backend-s3"
    key    = "timing"
    region = "us-east-2"
    dynamodb_table = "timing-lock"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2" //US East (Ohio)
}

