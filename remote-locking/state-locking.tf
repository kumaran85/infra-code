terraform {
	requrired_version = "= 0.11.15"
}
provider "aws" {
	profile = "default"
	region = "us-east-1"
}
	
resource "aws_s3_bucket" "remote" {
	bucket = "a204161-cloudops-testing-terraform"
	
	versioning {
		enabled = true
	}
	
	tags = { 
		
		"tr:Resource-owner" = "Kumaran M"
		Environment = "Development"
	}
	lifecycle {
	
		prevent_destroy = true
	}
	count = 0
}
resource "aws_dynamodb_table" "lock-file" {
	name = "a204161-clouops-testing-lock"
	hash_key = "test"
	read_capacity = 4
	write_capacity = 4
	
	attribute {
		name = "test"
		type = "S"
        }
	count = 0
}
		
#resource "aws_s3_bucket_public_access_block" "remote" {

#	bucket = aws_s3_bucket.remote.id
#	block_public_acls = true
#	block_public_policy = true
#}
