terraform {
  backend "s3" {
    bucket         = "699561668660-terraform-state"
    key            = "terraform-state/test.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "699561668660-terraform-state"
  }
}
