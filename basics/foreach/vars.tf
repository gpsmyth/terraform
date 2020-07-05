variable "AWS_REGION" {
  type    = string
  default = "ap-southeast-2"
}

variable "ingress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 443]
}
