terraform {
    backend "s3" {
        bucket = "terraform-s144-bucket" 
        key    = "home/terraform.tfstate"
        region = "us-east-1"
    }
}