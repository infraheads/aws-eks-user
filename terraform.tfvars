#----------NETWORK
# If you want to create a VPC for your cluster, set the variable value - true
create_vpc = false

#----------EKS-CLUSTER
#Infrastructure region
region                                = ""

# Your cluster name - Required
cluster_name                          = "" 
 
# If you set the value of the create_vpc variable to false, then be sure to set the value of this variable.
# In existing vpc id in the region where you would like your cluster to be
cluster_vpc_id                        = "" 

# If you set the value of the create_vpc variable to false, then you can set the value of this variable.
# Private subnet id in your vpc. List with more than one element
cluster_private_subnet_ids            = [] 

# If you set the value of the create_vpc variable to false, then be sure to set the value of this variable.
# Public subnet id in your vpc. List with more than one element
cluster_public_subnet_ids             = [] 

# If you set the value of the create_vpc variable to false, then be sure to set the value of this variable.
# Public subnet id in your vpc. List with more than one element
cluster_control_plane_subnet_ids      = [] 

# If you set the value of the create_vpc variable to false, then be sure to set the value of this variable.
# Public subnet id in your vpc. List with more than one element
eks_cluster_node_group_subnet_ids     = [] 

#Instance type for your nodes Required
eks_cluster_node_group_instance_types = []

#Your node group name Required
eks_cluster_node_group_name           = ""                                           

#The desired number of nodes to create
desired_size                          = 1

#The maximum number of nodes
max_size                              = 2

#The minimum number of nodes
min_size                              = 1

#----------EKS ADDONS
#----------ADDON CONTEXT  
#Addon deployment will not proceed until this value is known. Set to node group/Fargate profile ARN to wait for data plane 
#to be ready before provisioning addons" 
data_plane_wait_arn           = ""

#Additional tags for addons
tags                          = {}

#IAM role path for IRSA roles
irsa_iam_role_path            = ""

#IAM permissions boundary for IRSA roles	
irsa_iam_permissions_boundary = ""

#----------ArgoCD
# If you want to deploy ArgoCd in your cluster, set the variable value - true
enable_argocd = true

# With this variable, you can customize the deployment of ArgoCD, 
# for example,using the <version="5.20.3"> argument to set the version of ArgoCD. DEfault version is 5.13.8
# You can also use set to rewrite the values.yaml file
argocd_helm_config = {
  set = [
    {
      name  = "server.service.type"
      value = "LoadBalancer"
    }
  ]
}

#----------Argocd-apps
# If you want to deploy Argocd-application in your cluster, set the variable value - true
enable_argocd_apps                 = true

# Repository url for ArgoCD-apps
argocd_apps_chart_repo             = "https://argoproj.github.io/argo-helm"

# ArgoCD-app chart name
argocd_apps_chart_name             = "argocd-apps"

# ArgoCD-apps chart version
argocd_apps_chart_version          = "0.0.3"

# Namespace for ArgoCD-apps
argocd_apps_namespace              = "argocd"

# With this variable you can set the values.yaml file for your argocd-apps
# or leave it empty and set the following variables for the shared file
argocd_apps_values                 = ""

# Namespase for applications kind manifest
argocd_apps_name                   = ""

# ArgoCD project name
argocd_apps_project                = "default"

# if you create a repository using this module, then you can leave this variable empty.
# if not, then set the repository url where your manifests or helm charts are located.
argocd_apps_source_repo            = ""

# Branch or release code to pull in your repository. by default HEAD.
# For more info https://argocd-image-updater.readthedocs.io/en/v0.9.0/configuration/applications/
argocd_apps_source_target_revision = "HEAD"
# Directory where manifests or helm charts are located 
argocd_apps_source_target_path     = ""
# Search recursivly?
argocd_apps_source_target_recurse  = true
# Namespaces for deployments
argocd_apps_destination_namespace  = ""
# When automated sync enabled, by default it won’t delete any resources when argocd detects the resources is no longer defined in Git.
argocd_apps_prune                  = false
# To enable automatic sync when the live cluster's state deviates from the state defined in Git
argocd_apps_self_heal              = false

#----------Github repository
# If you want to create a github repository for your Argocd-apps, set the variable value - true
enable_github_repo        = false 

# Github account token where you want to create the repository
github_token              = ""

# Github username
github_owner              = ""

# Github repository name
github_repo_name          = ""

# Github repository description
github_description        = ""

# Github repository visibility public/private
github_visibility         = ""

# Github template repository owner username.
# Set this variable if you want create your repository from template repo
github_template_owner     = ""

# Github template repository name
# Set this variable if you want create your repository from template repo
github_template_repo_name = "" #default = null

#----------External dns
# If you want to deploy External DNS in your cluster, set the variable value - true
enable_external_dns            = false

# With this variable, you can customize the deployment of external dns, 
# for example,using the <version="6.13.0"> argument to set the version of ArgoCD. DEfault version is "6.11.2"
# You can also use set to rewrite the values.yaml file
external_dns_helm_config       = {}

# Additional IAM policies used for the add-on service account.
external_dns_irsa_policies     = []

# Domain name of the Route53 hosted zone to use with External DNS.
eks_cluster_domain             = ""

# Determines if referenced Route53 hosted zone is private.
external_dns_private_zone      = false

# List of Route53 zones ARNs which external-dns will have access to create/manage records
external_dns_route53_zone_arns = []

# If you want to create a route53 zone for your cluster, set the variable value - true
create_route53_zone            = true