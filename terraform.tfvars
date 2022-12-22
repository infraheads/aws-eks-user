region                                = "eu-central-1"
cluster_name                          = "Amigo"
cluster_version                       = "1.23"
cluster_vpc_id                        = "vpc-0cd9f1192089cc3d1"
cluster_private_subnet_ids            = []
cluster_public_subnet_ids             = ["subnet-041a52133419bb94a", "subnet-03f20810e9a9bcf9f"]
cluster_control_plane_subnet_ids      = ["subnet-041a52133419bb94a", "subnet-03f20810e9a9bcf9f"]
eks_cluster_node_group_instance_types = ["t3.medium"]
eks_cluster_node_group_subnet_ids     = ["subnet-041a52133419bb94a", "subnet-03f20810e9a9bcf9f"]
eks_cluster_node_group_name           = "my-nodegroup"
desired_size                          = 2
max_size                              = 5
min_size                              = 1
enable_argocd                         = true
argocd_helm_config                    = {}

#Argocd-apps
enable_argocd_apps                 = true #  default = false
argocd_apps_chart_repo             = "https://argoproj.github.io/argo-helm"
argocd_apps_chart_name             = "argocd-apps"
argocd_apps_chart_version          = "0.0.3"
argocd_apps_namespace              = "argocd"
argocd_apps_values                 = ""
argocd_apps_name                   = "my-app"
argocd_apps_project                = "default"
argocd_apps_source_repo            = "https://github.com/armenmelkonyan90/devops_task_ArgoCD"
argocd_apps_source_target_revision = "HEAD"
argocd_apps_source_target_path     = "ArgoApps"
argocd_apps_source_target_recurse  = true
argocd_apps_destination_namespace  = "my-app"
argocd_apps_prune                  = false
argocd_apps_self_heal              = false
    
#Github_repository
enable_github_repo    = true #default = false
github_token          = "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"
github_owner          = "armenmelkonyan90"
github_description    = ""                   #default =   
github_visibility     = "public"             #default =  public 
github_template_owner = "armenmelkonyan90"   #default = null
template_repo_name    = "devops_task_ArgoCD" #default = null

#External dnc
enable_external_dns            = "true"
external_dns_helm_config       = {}
external_dns_irsa_policies     = []
eks_cluster_domain             = "gymops.click"
external_dns_private_zone      = false
external_dns_route53_zone_arns = []
create_route53_zone            = true
