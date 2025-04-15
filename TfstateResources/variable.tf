variable "s3_bucket_name" {
    description = "The name of the S3 bucket to store the Terraform state for Particle41."
    type        = string
    default     = "particle41-terraform-state-bucket"
}

variable "dynamodb_table_name" {
    description = "The name of the DynamoDB table to store the Terraform state locks for Particle41."
    type        = string
    default     = "particle41-terraform-state-locks"
}