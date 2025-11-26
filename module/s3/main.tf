resource "aws_s3_bucket" "this" {
    bucket = var.s3_bucket
    
    
    
    tags = {
        CreatedBy = "terraform"
    }
  
}