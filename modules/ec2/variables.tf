variable "environment" {
  type    = string
  default = "dev"
}

variable "key_name" {
  type    = string
  default = "chavesclebinho"
}

variable "subnet_id" {
  type = string
}

variable "subnet_secondary_id" {
  type = string
}

variable "security_groups" {}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_id" {
  type = string
}
