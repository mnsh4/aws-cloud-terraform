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

resource "aws_security_group" "web_server" {
  name        = "youtube-web-server"
  description = "Allow inbound traffic"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# KEY PAIR
resource "tls_private_key" "youtube-rsa-4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# KEY PAIR
resource "aws_key_pair" "youtube-keypair" {
  key_name   = "deployer-key"
  public_key = tls_private_key.youtube-rsa-4096.public_key_openssh
}

resource "aws_instance" "ec2_amz_publ" {
  count         = var.private_server_count
  ami           = var.amz_ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.youtube-keypair.key_name
  subnet_id     = module.vpc-youtube.public_subnets[count.index]
  vpc_security_group_ids = [
    aws_security_group.server.id,
    aws_security_group.web_server.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  tags = {
    Name = "PrivateEC2-${count.index}"
  }
}


resource "aws_instance" "ec2_rhel9_priv" {
  count                  = var.public_server_count
  ami                    = var.rhel9_ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.youtube-keypair.key_name
  subnet_id              = module.vpc-youtube.private_subnets[count.index]
  vpc_security_group_ids = [aws_security_group.youtube_sg.id]

  user_data = <<-EOF
          #!/bin/bash
          yum update -y
          yum install -y httpd
          systemctl start httpd
          systemctl enable httpd
          echo "<h1>Hola Mundo desde $(hostname -f)</h1>" > /var/www/html/index.html
          EOF

  tags = {
    Name = "PublicEC2-${count.index}"
  }
}


