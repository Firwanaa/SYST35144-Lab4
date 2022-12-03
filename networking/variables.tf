variable "aws_region" {
  description = "AWS region"
  type        = string
}
variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "address_space" {
  type        = string
  description = "IPv4 address space"
}

variable "azs" {
  description = "Availability zones"
  type        = list(any)
}

variable "cidr_blocks" {
  description = "Public cidr for routing table"
  type        = list(any)
}

variable "private_address" {
  description = "Private address"
  type        = string
}
variable "public_address" {
  description = "Public address"
  type        = string
}
