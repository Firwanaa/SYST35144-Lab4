#create security group
resource "aws_security_group" "permit-web" {
  name        = var.sg_name
  description = "allow web traffic and SSH"
  vpc_id      = var.vpc_id
  ingress {
    description = "Allow SSH"
    from_port   = var.ports[0]
    to_port     = var.ports[0]
    protocol    = var.protocols[0]
    cidr_blocks = var.cidr_blocks
  }
  ingress {
    description = "Allow HTTP"
    from_port   = var.ports[1]
    to_port     = var.ports[1]
    protocol    = var.protocols[0]
    cidr_blocks = var.cidr_blocks
  }
  egress {
    description = "Allow all traffic"
    from_port   = var.ports[2]
    to_port     = var.ports[2]
    protocol    = var.protocols[1]
    cidr_blocks = var.cidr_blocks
  }
}
