provider "aws" {
  region = "eu-central-1"
}

terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6.0"
    }
  }

  required_version = "~> 1.0"
}

terraform {
  backend "s3" {
    bucket = "kubernetes.project"
    key = "terraform/test/terraform.tfstate"
    region = "eu-central-1"
  }
}