// @see https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.51.0
module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = "wm-case-study"
  cidr                 = "10.0.0.0/16"
  azs                  = var.availability-zones
  private_subnets      = var.private-subnet-cidr
  public_subnets       = var.public-subnet-cidr
  
  enable_nat_gateway = true
  enable_vpn_gateway = false
  
  single_nat_gateway  = false
  reuse_nat_ips       = true                    # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids = "${aws_eip.nat.*.id}"   # <= IPs specified here as input to the module

  tags = {
    Terraform = "true"
    Environment = "dev"
  }

  one_nat_gateway_per_az = true
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_eip" "nat" {
  count = 3

  vpc = true
}