# root/main.tf
module "networking" {
  source          = "./networking"
  aws_region      = "us-east-1"
  vpc_name        = "a4_vpc"
  azs             = ["us-east-1a", "us-east-1b"]
  address_space   = "192.168.0.0/16"
  private_address = "192.168.1.0/24"
  public_address  = "192.168.2.0/24"
  cidr_blocks     = ["0.0.0.0/0"]
}


module "sg" {
  source      = "./sg"
  sg_name     = "permit-web-ssh"
  ports       = [22, 80, 0]
  protocols   = ["tcp", "-1"]
  cidr_blocks = ["0.0.0.0/0"]
  vpc_id      = module.networking.output_vpc_a4_id
}

module "compute" {
  source          = "./compute"
  subnet_ids      = [module.networking.s1, module.networking.s2]
  ami             = "ami-047a51fa27710816e"
  instance_type   = "t2.micro"
  azs             = ["us-east-1a", "us-east-1b"]
  security_groups = [module.sg.output_sg]
  key_name        = "demo-key-26"
}
