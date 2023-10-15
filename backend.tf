terraform {
  required_providers {
    aws={
      source = "hashicorp/aws"
    }
  }
  cloud {
    organization = "example-org-8cb805"

    workspaces {
      name = "test-workspace"
    }
  }
}