resource "aws_security_group" "youtube_sg" {
  name        = "youtube_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc-youtube.vpc_id

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

data "aws_ami" "rhel9_ami_free" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9.*GA*x86_64*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["309956199498"] # Red Hat
}


resource "aws_instance" "youtube_rhel9_server" {
  count                  = var.server_count
  ami                    = data.aws_ami.rhel9_ami_free.id
  instance_type          = var.instance_type
  subnet_id              = module.vpc-youtube.public_subnets[count.index]
  vpc_security_group_ids = [aws_security_group.youtube_sg.id]

  tags = {
    Name = "Youtube-RHEL9"
  }
}
