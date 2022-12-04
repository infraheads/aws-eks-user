variable "region" {
	type = string
	description = "value"
	default = null
}
variable "cluster_name" {
	type = string
	description = "AWS EKC cluster name"
}
variable "cluster_version" {
	type = string
	description = "AWS EKS cluster version"
	default = "1.23"
}
variable "cluster_vpc_id" {
	type = string
	description = "Eks cluster vpc id"
}
# variable "cluster_private_subnet_ids" {
# 	type = list
# 	description = "Eks cluster private subnet ids"
# }
variable "cluster_public_subnet_ids" {
	type = list
	description = "Eks cluster public subnet ids"
}
variable "cluster_control_plane_subnet_ids" {
	type = list
	description = "Eks cluster controle plane subnet ids"
}
variable "eks_cluster_node_group_name" {
	type = string
	description = "Eks cluster node group name"  
}
variable "eks_cluster_node_group_instance_types" {
	type = list
	description = "AWS EKS cluster node types"  
}
variable "eks_cluster_node_group_subnet_ids" {
	type = list
	description = "Subnet id for eks cluster node group"

  
}
variable "desired_size" {
	type = number
	description = "AWS EKS cluster nodes desired size"
	default = 3
}
variable "max_size" {
	type = number
	description = "AWS EKS cluster nodes maximum size"
	default = 5
}
variable "min_size" {
	type = number
	description = "AWS EKS cluster nodes minimum size"
	default = 2
}
#ADDONS
#Argocd
variable "enable_argocd" {
	type = bool
	description = "Would you like create ArgoCD on your AWS EKS cluster"
	default = false
}
variable "argocd_helm_config" {
	type = map
	description = "Configurations for ArgoCD"
	default = {}
}
#Argocd-apps
variable "enable_argocd_apps" {
	type = bool
	description = "Would you like create Argocd-app on your AWS EKS cluster"
	default = false
}
variable "argocd_apps_chart_repo" {
	type = string
	description = "Argocd-apps helm chart repository"
	default = "https://argoproj.github.io/argo-helm" 
}
variable "argocd_apps_chart_name" {
	type = string
	description = "Argocd-apps helm chart name"
	default = "argocd-apps"
}
variable "argocd_apps_chart_version" {
	type = string
	description = "Argocd-apps helm chart version"
	default = "0.0.3"
}
variable "argocd_apps_namespace" {
	type = string
	description = "Argocd-apps namespase"
	default = "argocd"
}
variable "argocd_apps_repo_url" {
	type = string
	description = "Girhub repository for Argocd-apps"
	default = ""
}
variable "argocd_apps_repo_path" {
	type = string
	description = "Path in github repository for Application manifests"
	default = "ArgoApps"
}
variable "project_namespace" {
	type = string
	description = "Namespace in kubernetes for deploying project"
	default = "default"
}
#Github_repository
variable "github_token" {
	type = string
	description = "Github repository token"
}
variable "github_owner" {
	type = string
	description = "Github repository owner"
  
}
variable "enable_github_repo" {
	type = bool
	description = "Would you like create github repository Argocd-apps"
	default = false
}
variable "github_repo_name" {
  description = "The name of the GitHub repository that will be created."
  type = string
  default = ""
}

variable "github_description" {
  description = "The description of the GitHub repository that will be created."
  type = string
  default = ""
}

variable "github_visibility" {
  description = "The visibility of the GitHub repository that will be created."
  type = string
  default = "public"
}

variable "github_template_owner" {
  description = "GitHub template repository name. (Default: provider_owner)"
  type = string
  default = ""
}

variable "github_template_repo_name" {
  description = "GitHub template repository name. (Will not use a template, if not set)"
  type = string
  default = ""
}

#ExternalDNS
variable "enable_external_dns" {
	type = bool
	description = "Would you like create ArgoCD on your AWS EKS cluster"
	default = false
}
#Cert manager
# variable "enable_cert_manager" {
# 	type = bool
# 	description = "Would you like create ArgoCD on your AWS EKS cluster"
# 	default = false
# }
