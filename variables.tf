variable "region" {
  type        = string
  description = "value"
  default     = null
}

variable "cluster_name" {
  type        = string
  description = "AWS EKC cluster name"
}

variable "cluster_version" {
  type        = string
  description = "AWS EKS cluster version"
  default     = ""
}

variable "cluster_vpc_id" {
  type        = string
  description = "Eks cluster vpc id"
}

variable "cluster_private_subnet_ids" {
  type 	      = list
  description = "Eks cluster private subnet ids"
  default     = [""]
}

variable "cluster_public_subnet_ids" {
  type        = list(any)
  description = "Eks cluster public subnet ids"
}

variable "cluster_control_plane_subnet_ids" {
  type        = list(any)
  description = "Eks cluster controle plane subnet ids"
}

variable "eks_cluster_node_group_name" {
  type        = string
  description = "Eks cluster node group name"
}

variable "eks_cluster_node_group_instance_types" {
  type        = list(any)
  description = "AWS EKS cluster node types"
}

variable "eks_cluster_node_group_subnet_ids" {
  type        = list(any)
  description = "Subnet id for eks cluster node group"
}

variable "desired_size" {
  type        = number
  description = "AWS EKS cluster nodes desired size"
  default     = 1
}
variable "max_size" {
  type        = number
  description = "AWS EKS cluster nodes maximum size"
  default     = 1
}
variable "min_size" {
  type        = number
  description = "AWS EKS cluster nodes minimum size"
  default     = 1
}

#ADDONS

#Argocd
variable "enable_argocd" {
  type        = bool
  description = "Would you like create ArgoCD on your AWS EKS cluster"
  default     = false
}

variable "argocd_helm_config" {
  type        = map(any)
  description = "Configurations for ArgoCD"
  default     = {}
}

#Argocd-apps
variable "enable_argocd_apps" {
  type        = bool
  description = "Would you like create Argocd-app on your AWS EKS cluster"
  default     = false
}

variable "argocd_apps_chart_repo" {
  type        = string
  description = "Argocd-apps helm chart repository"
  default     = ""
}

variable "argocd_apps_chart_name" {
  type        = string
  description = "Argocd-apps helm chart name"
  default     = ""
}

variable "argocd_apps_chart_version" {
  type        = string
  description = "Argocd-apps helm chart version"
  default     = ""
}

variable "argocd_apps_namespace" {
  type        = string
  description = "Argocd-apps namespase"
  default     = ""
}

variable "argocd_apps_values" {
  type        = string
  description = "Values file for ArgoCD apps."
  default     = ""
}

variable "argocd_apps_name" {
  type        = string
  description = "Name for ArgoCD apps."
  default     = ""
}

variable "argocd_apps_project" {
  type        = string
  description = "Project for ArgoCD apps."
  default     = ""
}

variable "argocd_apps_source_repo" {
  type        = string
  description = "Source repository for ArgoCD apps."
  default     = ""
}

variable "argocd_apps_source_target_revision" {
  type        = string
  description = "Source repository's target revision for ArgoCD apps."
  default     = ""
}

variable "argocd_apps_source_target_path" {
  type        = string
  description = "Source repository's path on which ArgoCD apps are."
  default     = ""
}

variable "argocd_apps_source_target_recurse" {
  type        = bool
  description = "Source repository's directory recurse in which ArgoCD apps are."
  default     = true
}

variable "argocd_apps_destination_namespace" {
  type        = string
  description = "Destination namespace in which the applications will deploy manifests or charts."
  default     = ""
}

variable "argocd_apps_prune" {
  type        = bool
  description = "Whether enable prune function for ArgoCD apps."
  default     = false
}

variable "argocd_apps_self_heal" {
  type        = bool
  description = "Whether enable self heal function for ArgoCD apps."
  default     = false
}

#Github_repository
variable "github_token" {
  type        = string
  description = "Github repository token"
}

variable "github_owner" {
  type        = string
  description = "Github repository owner"
}

variable "enable_github_repo" {
  type        = bool
  description = "Would you like create github repository Argocd-apps"
  default     = false
}

variable "github_repo_name" {
  description = "The name of the GitHub repository that will be created."
  type        = string
  default     = ""
}

variable "github_description" {
  description = "The description of the GitHub repository that will be created."
  type        = string
  default     = ""
}

variable "github_visibility" {
  description = "The visibility of the GitHub repository that will be created."
  type        = string
  default     = "public"
}

variable "github_template_owner" {
  description = "GitHub template repository name. (Default: provider_owner)"
  type        = string
  default     = ""
}

variable "github_template_repo_name" {
  description = "GitHub template repository name. (Will not use a template, if not set)"
  type        = string
  default     = ""
}

#ExternalDNS

variable "enable_external_dns" {
  description = "External DNS add-on"
  type        = bool
  default     = false
}

variable "eks_cluster_domain" {
  description = "The domain for the EKS cluster"
  type        = string
  default     = ""
}

variable "argocd_manage_add_ons" {
  description = "Enable managing add-on configuration via ArgoCD App of Apps"
  type        = bool
  default     = false
}

variable "external_dns_helm_config" {
  description = "External DNS Helm Chart config"
  type        = any
  default     = {}
}

variable "external_dns_irsa_policies" {
  description = "Additional IAM policies for a IAM role for service accounts"
  type        = list(string)
  default     = []
}

variable "external_dns_private_zone" {
  type        = bool
  description = "Determines if referenced Route53 zone is private."
  default     = false
}

variable "external_dns_route53_zone_arns" {
  description = "List of Route53 zones ARNs which external-dns will have access to create/manage records"
  type        = list(string)
  default     = []
}

variable "create_route53_zone" {
  description = "Create a Route53 zone."
  type        = bool
  default     = false
}
