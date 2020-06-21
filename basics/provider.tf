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
    eu-west-2 = "eu-w2"
    us-east-1 = "use1"
  }
}

# the *.tf file declare that the variable exists. 
variable "AWS_REGION" {
  # type = string
}

variable env {

}
