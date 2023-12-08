# Componentes de mi red:
# - VPC: 172.31.0.0/24
# - SUBNET 1: 172.31.48.0/24
# - SUBNET 2: 172.31.64.0/24
# - SUBNET 3: 172.31.16.0/24

# Internet Gateway => VM puedan acceder a internet y clientes externos puedan acceder a la infra
# - Tabla de enrutamiento con asociacion hacia esa tabla

resource "aws_vpc" "vpc_youtube_network" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "subnet_youtube_net1"
  }
}

resource "aws_subnet" "subnet_network_a" {
  vpc_id            = aws_vpc.vpc_youtube_network.id
  cidr_block        = "172.31.48.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_network_a"
  }
}

resource "aws_subnet" "subnet_network_b" {
  vpc_id            = aws_vpc.vpc_youtube_network.id
  cidr_block        = "172.31.64.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet_network_b"
  }
}

resource "aws_subnet" "subnet_network_c" {
  vpc_id            = aws_vpc.vpc_youtube_network.id
  cidr_block        = "172.31.16.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "subnet_network_c"
  }
}

# variable "vpc_id" {}

resource "aws_internet_gateway" "youtube_igw" {
  vpc_id = aws_vpc.vpc_youtube_network.id

  tags = {
    Name = "youtube_igw"
  }
}

# Tabla de enrutamiento define a los servidores a donde tiene que ir el trafico
resource "aws_route_table" "youtube_route_table" {
  vpc_id = aws_vpc.vpc_youtube_network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.youtube_igw.id
  }

  tags = {
    Name = "youtube_route_table"
  }
}

resource "aws_route_table_association" "subnet_network_a" {
  subnet_id      = aws_subnet.subnet_network_a.id
  route_table_id = aws_route_table.youtube_route_table.id
}

resource "aws_route_table_association" "subnet_network_b" {
  subnet_id      = aws_subnet.subnet_network_b.id
  route_table_id = aws_route_table.youtube_route_table.id
}

resource "aws_route_table_association" "subnet_network_c" {
  subnet_id      = aws_subnet.subnet_network_c.id
  route_table_id = aws_route_table.youtube_route_table.id
}
