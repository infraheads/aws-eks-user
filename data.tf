data "aws_eks_cluster_auth" "this" {
  name = module.infraheads_aws_eks.eks_cluster_id
}

data "aws_availability_zones" "available" {}