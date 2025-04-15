terraform {
  backend "s3" {
    bucket         = "particle41-terraform-state-bucket"
    key            = "microservice/tfstate"
    region         = "us-east-1"
    dynamodb_table = "particle41-terraform-state-locks"
  }
}
