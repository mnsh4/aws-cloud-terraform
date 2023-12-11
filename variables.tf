variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "rhel9_ami" {
  description = "redhat enterprise linux 9"
  type        = string
  default     = "ami-023c11a32b0207432"
}

variable "amz_ami" {
  description = "amazon linux 2023"
  type        = string
  default     = "ami-0230bd60aa48260c6"
}

variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

variable "public_server_count" {
  type        = number
  description = "Instance count"
  default     = 1
}

variable "private_server_count" {
  type        = number
  description = "Instance count"
  default     = 1
}

variable "private_subnets" {
  type        = list(string)
  description = "value of private subnets"
}

variable "public_subnets" {
  type        = list(string)
  description = "value of public subnets"
}

variable "vpc_cidr" {
  type        = string
  description = "Network CIDR"
}

variable "name" {
  type        = string
  description = "Environment name"
  default     = "youtube" #optional
}

variable "tags" {
  type        = map(string)
  description = "tags for resources"
  default = {
    "Environment" = "dev"
  }
}

variable "enable_nat_gateway" {
  type        = bool
  description = "enable nat gateway"
  default     = true
}
