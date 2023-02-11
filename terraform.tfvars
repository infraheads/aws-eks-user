region                                = ""
cluster_name                          = "" #Required
cluster_vpc_id                        = "" #Required
cluster_private_subnet_ids            = []
cluster_public_subnet_ids             = [] #Required
cluster_control_plane_subnet_ids      = [] #Required
eks_cluster_node_group_instance_types = []                                            #Required
eks_cluster_node_group_subnet_ids     = [] #Required
eks_cluster_node_group_name           = ""                                           #Required
desired_size                          = 1
max_size                              = 2
min_size                              = 1

#--------EKS ADDONS---------
#ADDON CONTEXT  
data_plane_wait_arn           = ""
tags                          = {}
irsa_iam_role_path            = ""
irsa_iam_permissions_boundary = ""

#ARGO-CD
enable_argocd = true
argocd_helm_config = {
  set = [
    {
      name  = "server.service.type"
      value = "LoadBalancer"
    }
  ]
}
argocd_applications = {}

#Argocd-apps
enable_argocd_apps                 = true #  default = false
argocd_apps_chart_repo             = "https://argoproj.github.io/argo-helm"
argocd_apps_chart_name             = "argocd-apps"
argocd_apps_chart_version          = "0.0.3"
argocd_apps_namespace              = "argocd"
argocd_apps_values                 = ""
argocd_apps_name                   = ""
argocd_apps_project                = "default"
argocd_apps_source_repo            = ""
argocd_apps_source_target_revision = "HEAD"
argocd_apps_source_target_path     = ""
argocd_apps_source_target_recurse  = true
argocd_apps_destination_namespace  = ""
argocd_apps_prune                  = false
argocd_apps_self_heal              = false

#Github repository
enable_github_repo        = true #default = false
github_token              = ""
github_owner              = ""
github_repo_name          = ""
github_description        = ""              #default =   
github_visibility         = ""        #default =  public 
github_template_owner     = ""    #default = null
github_template_repo_name = "" #default = null

#External dns
enable_external_dns            = false
external_dns_helm_config       = {}
external_dns_irsa_policies     = []
eks_cluster_domain             = ""
external_dns_private_zone      = false
external_dns_route53_zone_arns = []
create_route53_zone            = true