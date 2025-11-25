provider "aws" {
  region = "us-east-1"


}
module "ec2" {
  source = "./module/ec2"
  instance_type = var.instance_type
  ami_id = var.ami_id
  enviroment = var.enviroment
  web_sg = var.web_sg
  ssh_sg = var.ssh_sg
  
}
