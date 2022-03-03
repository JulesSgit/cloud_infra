terraform {
  required_version = "=1.1.6"
}

# Configure the AWS Provider
provider "aws" {
  region  = var.aws-region
  profile = "default"
}
