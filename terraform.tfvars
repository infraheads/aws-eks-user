# region = us_north_1
cluster_name = "demo"
# cluster_version   = ""   # default =  1.23 
cluster_vpc_id   = "vpc-099f541c1e0355870"
# cluster_private_subnet_ids   = []
cluster_public_subnet_ids  = ["subnet-0d29af39329819d69", "subnet-0f72d078e790654e3"]
cluster_control_plane_subnet_ids = ["subnet-0d29af39329819d69", "subnet-0f72d078e790654e3"]
eks_cluster_node_group_instance_types =  ["t3.medium"]
eks_cluster_node_group_subnet_ids = ["subnet-0d29af39329819d69", "subnet-0f72d078e790654e3"]
eks_cluster_node_group_name = "my-nodegroup"
#desired_size  = # default = 3
# max_size   = # default = 5
# min_size   = # default = 2
enable_argocd   = true  # default = false
#argocd_helm_config = #default = {}
#Argocd-apps
enable_argocd_apps   = true #  default = false
#argocd_apps_chart_repo =  # default =  https://argoproj.github.io/argo-helm  
# argocd_apps_chart_name   = # default =  argocd-apps 
# argocd_apps_chart_version   = #default =  0.0.3 
# argocd_apps_namespace   = #default =  argocd 
# argocd_apps_repo_url  = #default =   
# argocd_apps_repo_path   = "/" #default =  / 
# project_namespace   = #default =  default 
#Github_repository
enable_github_repo   = true  #default = false
github_token = "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"
github_owner = "armenmelkonyan90"
github_description   = "" #default =   
github_visibility   = "public" #default =  public 
github_template_owner   = "armenmelkonyan90" #default = null
template_repo_name   = "devops_task_ArgoCD"  #default = null


