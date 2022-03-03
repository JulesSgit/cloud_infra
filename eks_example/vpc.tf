// @see https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.51.0
module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = "wm-case-study"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-east-1a"]
  private_subnets      = ["10.0.1.0/24"]
  public_subnets       = ["10.0.101.0/24"]
  
  enable_nat_gateway = true
  enable_vpn_gateway = true
  
  single_nat_gateway  = false
  reuse_nat_ips       = true                    # <= Skip creation of EIPs for the NAT Gateways
  #external_nat_ip_ids = "${aws_eip.nat.*.id}"   # <= IPs specified here as input to the module

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
  enable_dns_hostnames = true
  enable_dns_support   = true
}
