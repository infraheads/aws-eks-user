terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72, <= 4.36.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4.1"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.7.0"
    }
  }
}
provider "aws" {
}
provider "kubernetes" {
  host                   = module.infraheads_aws_eks.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.infraheads_aws_eks.eks_cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.this.token
}

provider "helm" {
  kubernetes {
    host                   = module.infraheads_aws_eks.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.infraheads_aws_eks.eks_cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}
provider "github" {
  token = var.github_token
  owner = var.github_owner
}