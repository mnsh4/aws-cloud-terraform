
module "network" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "${var.name}-vpc"
  cidr = var.vpc_cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  # private_subnets = var.private_subnets
  # public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = local.single_nat_gateway

  tags = var.tags
}
