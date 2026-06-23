# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-bucket-72061"
#     key            = "aws_project/terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform-state-lock"
#     encrypt        = true
#   }
# }
