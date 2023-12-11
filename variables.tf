

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


# variable "private_subnets" {
#   type        = list(string)
#   description = "value of private subnets"
# }

# variable "public_subnets" {
#   type        = list(string)
#   description = "value of public subnets"
# }

#Mandatory Variables
variable "vpc_cidr" {
  type        = string
  description = "Network CIDR"
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "public_server_count" {
  type        = number
  description = "Public Instance count"
  default     = 1
}

variable "private_server_count" {
  type        = number
  description = "Public Instance count"
  default     = 1
}

#Optional Variables
variable "name" {
  type        = string
  description = "Environment name"
  default     = "youtube" #optional
}

variable "enable_nat_gateway" {
  type        = bool
  description = "enable nat gateway"
  default     = true
}

variable "include_ipv4" {
  type        = bool
  description = "Assign public IP to instances in public subnets"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "tags for resources"
  default = {
    "Environment" = "dev"
  }
}

variable "create_key_pair" {
  type        = bool
  description = "create key pair"
  default     = true
}

variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}
