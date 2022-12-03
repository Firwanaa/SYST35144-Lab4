variable "subnet_ids" {
  default = ["s1", "s2"]
  type    = list(any)
}
variable "ami" {
  description = "Instance ami"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}
variable "azs" {
  description = "Availability zone"
  type        = list(any)
}

variable "security_groups" {
  description = "Security groups"
  type        = list(any)
}

variable "key_name" {
  description = "Key name"
  type        = string
}
