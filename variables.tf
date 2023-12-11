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
