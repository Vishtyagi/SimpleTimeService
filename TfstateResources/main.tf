provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = var.s3_bucket_name
    acl    = "private"

    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = true
    }
   

    tags = {
        Name        = "TerraformStateBucket"
        Environment = "Dev"
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name         = var.dynamodb_table_name
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    lifecycle {
        prevent_destroy = true
    }
   
    tags = {
        Name        = "TerraformStateLocks"
        Environment = "Dev"
    }
}