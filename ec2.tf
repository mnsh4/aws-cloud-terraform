resource "aws_security_group" "youtube_sg" {
  name        = "youtube_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc_youtube_network.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_tls"
  }

}

resource "aws_instance" "youtube_ec2_rhel9" {
  ami           = var.rhel9_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet_network_a.id

  tags = {
    Name = "EC2-RHEL9"
  }
}
