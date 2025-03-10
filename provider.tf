terraform {
  cloud {
    organization = "djoo-hashicorp"

    workspaces {
      name = "vault-eks-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = module.eks.cluster_auth_token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

