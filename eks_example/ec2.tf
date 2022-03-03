resource "aws_eip" "webserver" {
  vpc = true

  tags = {
    Name = "webserver ip"
  }
}

resource "aws_instance" "ghost" {
  ami                         = "ami-01ae2cc311c621dfb"
  instance_type               = "t2.small"
  vpc_security_group_ids      = [module.vpc.default_security_group_id, aws_security_group.web.id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
}

output "ghost_domain" {
  value = aws_instance.ghost.public_dns
}
