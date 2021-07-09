variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "GerrysVPC"
}

variable "author" {
  type    = string
  default = "Gerry"
}

variable "cidr" {
  default = "10.0.0.0/20"
}

variable "cidr_block" {
  default = "10.0.0.0/20"
}

# variable "subnet_count" {
#   type = number
#   default = 1
# }

# variable "private_sn_count" {}