locals {
  argocd_apps_repo_url = var.enable_github_repo ? module.infraheads_aws_eks_addons.github_repository_url : var.argocd_apps_repo_url
}