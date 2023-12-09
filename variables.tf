variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

# Red Hat Enterprise Linux 9 (HVM) (free tier)
variable "rhel9_ami" {
  description = "ami"
  type        = string
  default     = "ami-023c11a32b0207432"
}

variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

variable "server_count" {
  type        = number
  description = "Instance name"
  default     = 1
}
