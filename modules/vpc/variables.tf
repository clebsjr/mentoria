variable "environment" {
  type    = string
  default = "dev"
}

variable "allow_ports" {
  type = map(object({
    port      = number
    cidr_ipv4 = string
  }))
  default = {
    http = {
      port      = 80
      cidr_ipv4 = "0.0.0.0/0"
    }
    https = {
      port      = 443
      cidr_ipv4 = "0.0.0.0/0"
    }
    ssh = {
      port      = 22
      cidr_ipv4 = "177.9.21.193/32"
    }
  }
}
