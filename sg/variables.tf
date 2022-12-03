variable "sg_name" {
  description = "Allow Web and Admin access"
  type        = string
}

variable "ports" {
  description = "list of ports"
  type        = list(any)
}

variable "protocols" {
  description = "list of protocols"
  type        = list(any)
}

variable "cidr_blocks" {
  description = "Allow access to all IPv4"
  type        = list(any)
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
