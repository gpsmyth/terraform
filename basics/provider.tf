# provider "aws" {
#   version = "~> 2.0"
# }
provider "aws" {
  version = "~> 2.24"
  region  = var.region
}

variable "region" {
  type    = string
  default = "ap-southeast-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "my amis"
  }
}

# the *.tf file declare that the variable exists. 
variable "AWS_REGION" {
  # type = string
}

variable env {

}