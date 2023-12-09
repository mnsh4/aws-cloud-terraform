module "vpc-youtube" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-youtube-desa"
  cidr = "172.31.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets = ["172.31.48.0/20", "172.31.64.0/20", "172.31.16.0/20"]   # Salen por NAT Gateway
  public_subnets  = ["172.31.96.0/20", "172.31.112.0/20", "172.31.128.0/20"] # Salen por Internet Gateway

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
