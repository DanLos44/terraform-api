terraform {
  backend "s3" {
    bucket = "losev"
    key    = "state.tfstate"
    region = "us-east-1"
  }
}

