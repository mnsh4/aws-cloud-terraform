terraform {
  required_providers {
    # We use the aws provider in Tf
    aws = {
      source  = "hashicorp/aws" # Public Registry
      version = "~>5.29.0"
    }
  }
}
