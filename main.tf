provider "aws" {
  region = "us-east-1"
  profile = "lab"
}

terraform {
backend "s3" {
      profile   = "lab"
      bucket    = "meu-curso-aws-terraform-remote-state-dev"
      key       = "iam/iam.tfstate"
      region    = "us-east-1"
  }
}



