variable "AWS_REGION" {
  default = "eu-west-1"
}

# variable "PATH_TO_PRIVATE_KEY" {
#   default = "mykey"
# }

# variable "PATH_TO_PUBLIC_KEY" {
#   default = "mykey.pub"
# }
variable "key_name" {
  default = "aws_gps"
}

# Command like
# `aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --region us-west-2`
# performed to obtain latest AMIs
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1      = "ami-09d95fab7fff3776c"
    us-west-2      = "ami-0e34e7b9ca0ace12d"
    eu-west-1      = "ami-0ea3405d2d2522162"
    ap-southeast-2 = "ami-088ff0e3bde7b3fdf"
  }
}

