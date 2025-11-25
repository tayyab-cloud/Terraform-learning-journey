provider "aws" {
  region = "us-east-1"
}

# --- MODULE 1: WEB SERVER ---
module "ec2" {
  source        = "./module/ec2"      
  instance_type = var.instance_type   
  ami_id        = var.ami_ubuntu      
}
# --- MODULE 2: DB SERVER ---
module "dbserver" {
  source        = "./module/ec2"      
  instance_type = var.instance_type   
  ami_id        = var.ami_linux       
}