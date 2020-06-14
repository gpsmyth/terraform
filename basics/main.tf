variable "myvar" {
  type    = string
  default = "Hello Gerry's Terraform"
}

variable "mymap" {
  type = map(string)
  default = {
    key1 : "Gerry's first key",
    mykey : "Gerry's first keymap",
    default : "Default key"
  }
}

variable "mylist" {
  type    = list
  default = [[1, 2, 3, 4, 5], [10, 9, 8]]
}

variable "mynumber" {
  type = number
  default = 12
}

variable "TorF" {
  type = bool
  default = true
}