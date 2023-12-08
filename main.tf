locals {
  ami_name      = "ami-023c11a32b0207432" # Red Hat Enterprise Linux 9 (HVM) (free tier)
  instance_type = "t2.micro"
}

data "aws_region" "current" {}

resource "aws_instance" "rhel9_instance" {
  ami           = local.ami_name
  instance_type = local.instance_type

  tags = {
    Name = "RHEL9Instance"
  }
}

output "rhel9_instance" {
  value = {
    id        = aws_instance.rhel9_instance.id
    public_ip = aws_instance.rhel9_instance.public_ip
  }
}

output "region" {
  value = data.aws_region.current.name
}
