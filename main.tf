provider "aws" {
  region = "us-east-1"
}



module "instance_type" {
  source        = "./module/ec2"
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
  ami_id        = var.ami_ubuntu
  
}


