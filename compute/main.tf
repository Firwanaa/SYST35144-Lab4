# Create EC2 instance in the public subnet
resource "aws_instance" "VM-01" {
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = var.subnet_ids[0]
  availability_zone = var.azs[0]
  security_groups   = var.security_groups
  key_name          = var.key_name
  tags              = { Name = "VM-01" }
  user_data         = file("${path.module}/userdata.sh")
}

# Create EC2 instance in the private subnet
resource "aws_instance" "VM-02" {
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = var.subnet_ids[1]
  availability_zone = var.azs[1]
  security_groups   = var.security_groups
  key_name          = var.key_name
  tags              = { Name = "VM-02" }
  user_data         = file("${path.module}/userdata.sh")
}
