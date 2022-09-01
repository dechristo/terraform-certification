variable "vpc_name" {
  type    = string
  default = "my_vpc"
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "enabled" {
    default = true
}

variable "my_list" {
    type = list(string)
    default = ["v1", "v2"]
}

variable "my_map" {
    type = map
    default = {
        key1 = "value1"
        key2 = "value2"
    }
}
