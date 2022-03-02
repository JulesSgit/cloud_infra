resource "aws_eip" "webserver" {
  vpc = true

  tags = {
    Name = "webserver ip"
  }
}

resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat eip"
  }
}

resource "aws_instance" "ghost" {
  ami                         = "ami-01ae2cc311c621dfb"
  instance_type               = "t2.small"
  vpc_security_group_ids      = [aws_security_group.lb.id, aws_security_group.web.id]
  subnet_id                   = aws_subnet.public_a
  associate_public_ip_address = true
}

output "ghost_domain" {
  value = aws_instance.ghost.public_dns
}
