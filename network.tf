resource "aws_vpc" "vpc_youtube_net1" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "subnet_youtube_net1"
  }
}

resource "aws_subnet" "subnet_youtube_net1" {
  vpc_id            = aws_vpc.vpc_youtube_net1.id
  cidr_block        = "172.31.48.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_youtube_net1"
  }
}

resource "aws_subnet" "subnet_youtube_net2" {
  vpc_id            = aws_vpc.vpc_youtube_net1.id
  cidr_block        = "172.31.64.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet_youtube_net2"
  }
}

resource "aws_subnet" "subnet_youtube_net3" {
  vpc_id            = aws_vpc.vpc_youtube_net1.id
  cidr_block        = "172.31.16.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "subnet_youtube_net3"
  }
}

