module "infraheads_aws_eks" {
  source = "../infraheads_aws_eks"
  # source = "https://github.com/infraheads/infraheads_aws_eks.git"

  # EKS CLUSTER
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id = var.cluster_vpc_id # Enter VPC ID
  # private_subnet_ids       = var.cluster_private_subnet_ids
  public_subnet_ids        = var.cluster_public_subnet_ids
  control_plane_subnet_ids = var.cluster_control_plane_subnet_ids

  # EKS MANAGED NODE GROUPS
  managed_node_groups = {
    node_group = {
      node_group_name = var.eks_cluster_node_group_name # Max node group length is 40 characters; including the node_group_name_prefix random id it's 63
      instance_types  = var.eks_cluster_node_group_instance_types
      subnet_ids      = var.eks_cluster_node_group_subnet_ids
      desired_size    = var.desired_size
      max_size        = var.max_size
      min_size        = var.min_size

    }
  }
}


module "infraheads_aws_eks_addons" {
  source = "../infraheads_aws_eks/modules"
  # source = "https://github.com/infraheads/infraheads_aws_eks.git/modules"

  eks_cluster_id       = module.infraheads_aws_eks.eks_cluster_id
  eks_cluster_endpoint = module.infraheads_aws_eks.eks_cluster_endpoint
  eks_oidc_provider    = module.infraheads_aws_eks.oidc_provider
  eks_cluster_version  = module.infraheads_aws_eks.eks_cluster_version

  #ArgoCD
  enable_argocd      = var.enable_argocd
  argocd_helm_config = var.argocd_helm_config #need changes

  #Argocd_apps
  enable_argocd_apps                 = var.enable_argocd_apps
  argocd_apps_chart_repo             = var.argocd_apps_chart_repo
  argocd_apps_chart_name             = var.argocd_apps_chart_name
  argocd_apps_chart_version          = var.argocd_apps_chart_version
  argocd_apps_namespace              = var.argocd_apps_namespace
  argocd_apps_values                 = var.argocd_apps_values
  argocd_apps_name                   = var.argocd_apps_name
  argocd_apps_project                = var.argocd_apps_project
  argocd_apps_source_repo            = local.argocd_apps_repo_url
  argocd_apps_source_target_revision = var.argocd_apps_source_target_revision
  argocd_apps_source_target_path     = var.argocd_apps_source_target_path
  argocd_apps_source_target_recurse  = var.argocd_apps_source_target_recurse
  argocd_apps_destination_namespace  = local.argocd_apps_destination_namespace
  argocd_apps_prune                  = var.argocd_apps_prune
  argocd_apps_self_heal              = var.argocd_apps_self_heal


  #Github Repository
  enable_github_repo        = var.enable_github_repo
  github_repo_name          = var.cluster_name
  github_description        = var.github_description
  github_visibility         = var.github_visibility
  github_template_owner     = var.github_template_owner
  github_template_repo_name = var.github_template_repo_name

  #External DNS
  enable_external_dns            = var.enable_external_dns
  external_dns_irsa_policies     = var.external_dns_irsa_policies
  eks_cluster_domain_name        = var.eks_cluster_domain
  external_dns_private_zone      = var.external_dns_private_zone
  external_dns_route53_zone_arns = var.external_dns_route53_zone_arns
  create_route53_zone            = var.create_route53_zone
  #   # ArgoCD workflow
  #   enable_argo_workflows          = var.enable_argo_workflows
  #   argo_workflows_helm_config     = var.argo_workflows_helm_config
  #   argocd_manage_add_ons          = var.argocd_manage_add_ons
  #   # Crossplane
  #   enable_crossplane              = var.enable_crossplane
  #   crossplane_helm_config         = var.crossplane_helm_config
  #   crossplane_aws_provider        = var.crossplane_aws_provider
  #   crossplane_jet_aws_provider    = var.crossplane_jet_aws_provider
  #   crossplane_kubernetes_provider = var.crossplane_kubernetes_provider
  #   crossplane_account_id          = data.aws_caller_identity.current.account_id
  #   crossplane_aws_partition       = data.aws_partition.current.id
}
