# AWS EKS Terraform module

## Purpose
Terraform module which creates AWS EKS (Kubernetes) cluster and associated resources.

## Description

# Getting Started
## Prerequisites
Before using the module, you need to install the following tools:

- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- *You also need to have an [AWS account](https://portal.aws.amazon.com/billing/signup#/start/email)*

## Activating the module
```bash
git clone https://github.com/infraheads/aws-eks-user.git
cd aws-eks-user
```
*In the aws-eks-user folder there is the file [terraform.tfvars](https://github.com/infraheads/aws-eks-user/blob/main/terraform.tfvars), which is designed to overload the default values.*
### Usage/Examples
```bash
region                                = "eu-central-1"
cluster_name                          = "Amigo"       # Required
cluster_version                       = "1.23"
enable_argocd                         = true
argocd_apps_chart_version             = "0.0.3"
enable_ingress_nginx                  = true
```
## Terraform
```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```
***Be careful**, there are **required variables**, if you don't enter them, the module simply won't work, for example cluster_public_subnet_ids etc.*

## Updating values
If you run this module and then you need to change some variables, such as the ArgoCD app version, you should simply open terraform.tfvars and update the variable values.
```bash
region                                = "eu-central-1"
cluster_name                          = "Amigo"       # Required
cluster_version                       = "1.23"
enable_argocd                         = true
argocd_apps_chart_version             = "0.0.4"
enable_ingress_nginx                  = true
```
```bash
terraform apply
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|region | AWS region | `string` | `null` | no |
|cluster_name | AWS EKC cluster name | `string` | | yes |
|cluster_version | AWS EKS cluster version | `string` | `""` | no |
|cluster_vpc_id | Eks cluster vpc id | `string` |   | yes |
|cluster_private_subnet_ids | Eks cluster private subnet ids | `list` | `[""]` | no |
|cluster_public_subnet_ids | Eks cluster public subnet ids | `list(any)` |  | yes |
|cluster_control_plane_subnet_ids | Eks cluster controle plane subnet ids | `list(any)` |  | yes |
|eks_cluster_node_group_name | Eks cluster node group name | `string` |  | yes |
|eks_cluster_node_group_instance_types | AWS EKS cluster node types | `list(any)` |  | yes |
|eks_cluster_node_group_subnet_ids | Subnet id for eks cluster node group | `list(any)` |  | yes |
|desired_size | AWS EKS cluster nodes desired size | `number` | `1` | no |
|max_size | AWS EKS cluster nodes maximum size | `number` | `1` | no |
|min_size | AWS EKS cluster nodes minimum size | `number` | `1` | no |
|EKS MANAGED ADD-ONS
|enable_ipv6 | Enable Ipv6 network. Attaches new VPC CNI policy to the IRSA role | `bool` | `false` | no |
|amazon_eks_vpc_cni_config | ConfigMap of Amazon EKS VPC CNI add-on | `any` | `{}` | no |
|enable_amazon_eks_coredns | Enable Amazon EKS CoreDNS add-on | `bool` | `false` | no |
|amazon_eks_coredns_config | Configuration for Amazon CoreDNS EKS add-on | `any` | `{}` | no |
|enable_self_managed_coredns | Enable self-managed CoreDNS add-on | `bool` | `false` | no |
|self_managed_coredns_helm_config | Self-managed CoreDNS Helm chart config | `any` | `{}` | no |
|remove_default_coredns_deployment | Determines whether the default deployment of CoreDNS is removed and ownership of kube-dns passed to Helm | `bool` | `false` | no |
|enable_coredns_cluster_proportional_autoscaler | Enable cluster-proportional-autoscaler for CoreDNS | `bool` | `true` | no |
|coredns_cluster_proportional_autoscaler_helm_config | Helm provider config for the CoreDNS cluster-proportional-autoscaler | `any` | `{}` | no |
|amazon_eks_kube_proxy_config | ConfigMap for Amazon EKS Kube-Proxy add-on | `any` | `{}` | no |
|amazon_eks_aws_ebs_csi_driver_config | configMap for AWS EBS CSI Driver add-on | `any` | `{}` | no |
|enable_amazon_eks_vpc_cni | Enable VPC CNI add-on | `bool` | `false` | no |
|enable_amazon_eks_kube_proxy | Enable Kube Proxy add-on | `bool` | `false` | no |
|enable_amazon_eks_aws_ebs_csi_driver | Enable EKS Managed AWS EBS CSI Driver add-on; enable_amazon_eks_aws_ebs_csi_driver and enable_self_managed_aws_ebs_csi_driver are mutually exclusive | `bool` | `false` | no |
|enable_self_managed_aws_ebs_csi_driver | Enable self-managed aws-ebs-csi-driver add-on; enable_self_managed_aws_ebs_csi_driver and enable_amazon_eks_aws_ebs_csi_driver are mutually exclusive | `bool` | `false` | no |
|self_managed_aws_ebs_csi_driver_helm_config | Self-managed aws-ebs-csi-driver Helm chart config | `any` | `{}` | no |
|custom_image_registry_uri | Custom image registry URI map of `{region = dkr.endpoint }` | `map(string)` | `{}` | no |
|AGONES
|enable_agones | Enable Agones GamServer add-on | `bool` | `false` | no |
|agones_helm_config | Agones GameServer Helm Chart config | `any` | `{}` | no |
|Apache Airflow ADDON
|enable_airflow | Enable Airflow add-on | `bool` | `false` | no |
|airflow_helm_config | Apache Airflow v2 Helm Chart config | `any` | `{}` | no |
|
|eks_cluster_id | EKS Cluster Id | `string` |  | yes |
|eks_cluster_domain | The domain for the EKS cluster | `string` | `""` | no |
|eks_worker_security_group_id | EKS Worker Security group Id created by EKS module | `string` | `""` | no |
|data_plane_wait_arn | Addon deployment will not proceed until this value is known. Set to node group/Fargate profile ARN to wait for data plane to be ready before provisioning addons | `string` | `""` | no |
|auto_scaling_group_names | List of self-managed node groups autoscaling group names | `list(string)` | `[]` | no |
|tags | Additional tags (e.g. `map('BusinessUnit`,`XYZ`) | `map(string)` | `{}` | no |
|irsa_iam_role_path | IAM role path for IRSA roles | `string` | `"/"` | no |
|irsa_iam_permissions_boundary | IAM permissions boundary for IRSA roles | `string` | `""` | no |
|eks_oidc_provider | The OpenID Connect identity provider (issuer URL without leading `https://`) | `string` | `null` | no |
|eks_oidc_provider_arn | The OpenID Connect identity provider ARN | `string` | `null` | no |
|eks_cluster_endpoint | Endpoint for your Kubernetes API server | `string` | `null` | no |
|eks_cluster_version | The Kubernetes version for the cluster | `string` | `null` | no |
|EXTERNAL DNS
|enable_external_dns | External DNS add-on | `bool` | `false` | no |
|data_plane_wait_arn | Addon deployment will not proceed until this value is known. Set to node group/Fargate profile ARN to wait for data plane to be ready before provisioning addons | `string` | `""` | no |
|eks_cluster_domain_name | Domain name of the Route53 hosted zone to use with External DNS. | `string` | `""` | no |
|external_dns_helm_config | External DNS Helm Chart config | `any` | `{}` | no |
|external_dns_irsa_policies | Additional IAM policies for a IAM role for service accounts | `list(string)` | `[]` | no |
|external_dns_private_zone | Determines if referenced Route53 zone is private. | `false` | `null` | no |
|external_dns_route53_zone_arns | List of Route53 zones ARNs which external-dns will have access to create/manage records | `list(string)` | `[]` | no |
|create_route53_zone | Create a Route53 zone. | `bool` | `false` | no |
|ARGOCD WORKFLOWS
|enable_argo_workflows | Enable Argo workflows add-on | `bool` | `false` | no |
|argocd_helm_config | Argo CD Kubernetes add-on config | `any` | `{}` | no |
|argo_workflows_helm_config | Argo workflows Helm Chart config | `any` | `null` | no |
|ARGOCD ADDON
|enable_argocd | Enable Argo CD Kubernetes add-on | `bool` | `false` | no |
|argocd_helm_config | Argo CD Kubernetes add-on config | `any` | `{}` | no |
|argocd_applications | Argo CD Applications config to bootstrap the cluster | `any` | `{}` | no |
|argocd_manage_add_ons | Enable managing add-on configuration via ArgoCD App of Apps | `bool` | `false` | no |
|ARGOCD APPS
|enable_argocd_apps | Enable ArgoCD Apps. | `bool` | `false` | no |
|argocd_apps_chart_repo | Argocd apps helm chart repository | `string` | `""` | no |
|argocd_apps_chart_name | Argocd application helm chart name | `string` | `""` | no |
|argocd_apps_chart_version | Argocd apps helm chart version | `string` | `""` | no |
|argocd_apps_namespace | Argocd apps namespace | `string` | `""` | no |
|argocd_apps_values | Values file for ArgoCD apps. | `string` | `""` | no |
|argocd_apps_name | Name for ArgoCD apps. | `string` | `""` | no |
|argocd_apps_project | Project for ArgoCD apps. | `string` | `""` | no |
|argocd_apps_source_repo | Source repository for ArgoCD apps. | `string` | `""` | no |
|argocd_apps_source_target_revision | Source repository's target revision for ArgoCD apps. | `string` | `""` | no |
|argocd_apps_source_target_path | Source repository's path on which ArgoCD apps are. | `string` | `""` | no |
|argocd_apps_source_target_recurse | Source repository's directory recurse in which ArgoCD apps are. | `bool` | `false` | no |
|argocd_apps_destination_namespace | Destination namespace in which the applications will deploy manifests or charts. | `string` | `""` | no |
|argocd_apps_prune | Whether enable prune function for ArgoCD apps. | `bool` | `false` | no |
|enable_argo_rollouts | Enable Argo Rollouts add-on | `bool` | `false` | no |
|argo_rollouts_helm_config | Argo Rollouts Helm Chart config | `any` | `null` | no |
|AWS EFS CSI DRIVER ADDON
|enable_aws_efs_csi_driver | Enable AWS EFS CSI driver add-on | `bool` | `false` | no |
|aws_efs_csi_driver_helm_config | AWS EFS CSI driver Helm Chart config | `any` | `{}` | no |
|aws_efs_csi_driver_irsa_policies | Additional IAM policies for a IAM role for service accounts | `list(string)` | `[]` | no |
|AWS EFS CSI DRIVER ADDON
|enable_aws_fsx_csi_driver | Enable AWS FSx CSI driver add-on | `bool` | `null` | no |
