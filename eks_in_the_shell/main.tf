terraform {
  required_version = "=1.1.6"
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "default"
}