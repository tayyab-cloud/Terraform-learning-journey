terraform {
  backend "s3" {
    bucket = "tayyab-terraform-state-unique-2025"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
    
  
}