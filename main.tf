provider "aws" {
  region = "us-east-1"
}



module "networking" {
  source      = "./module/vpc"
  vpc_cidr    = var.root_vpc_cidr
  subnet_cidr = var.root_subnet_cidr
  
}

# --- MODULE 1: WEB SERVER ---
module "compute" {
  source        = "./module/ec2"      
  instance_type = var.instance_type   
  ami_id        = var.ami_ubuntu  
  subnet_id     = module.networking.subnet_id
  sg_id         = module.networking.my_sg    
}