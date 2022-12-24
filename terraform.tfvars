region                                = "eu-central-1"
cluster_name                          = "Amigo" #Required
cluster_version                       = "1.23"
cluster_vpc_id                        = "vpc-099f541c1e0355870" #Required
cluster_private_subnet_ids            = []
cluster_public_subnet_ids             = ["subnet-0d29af39329819d69", "subnet-0f72d078e790654e3"] #Required
cluster_control_plane_subnet_ids      = ["subnet-0d29af39329819d69", "subnet-0f72d078e790654e3"] #Required
eks_cluster_node_group_instance_types = ["t3.medium"]                                            #Required
eks_cluster_node_group_subnet_ids     = ["subnet-0d29af39329819d69", "subnet-0f72d078e790654e3"] #Required
eks_cluster_node_group_name           = "my-nodegroup"                                           #Required
desired_size                          = 1
max_size                              = 5
min_size                              = 1

#--------EKS ADDONS---------

#ADDON CONTEXT  
eks_cluster_endpoint          = ""
eks_oidc_provider             = ""
data_plane_wait_arn           = ""
eks_cluster_id                = "1"
tags                          = {}
irsa_iam_role_path            = ""
irsa_iam_permissions_boundary = ""

#AWS VPC CNI
enable_amazon_eks_vpc_cni = false
enable_ipv6               = false
amazon_eks_vpc_cni_config = {}

#AWS COREDNS
custom_image_registry_uri                           = {}
enable_amazon_eks_coredns                           = false
enable_self_managed_coredns                         = false
amazon_eks_coredns_config                           = {}
self_managed_coredns_helm_config                    = {}
enable_coredns_cluster_proportional_autoscaler      = false
coredns_cluster_proportional_autoscaler_helm_config = {}
remove_default_coredns_deployment                   = false

#AWS KUBE PROXY
enable_amazon_eks_kube_proxy = false
amazon_eks_kube_proxy_config = {}

#AWS EBS CSI DRIVER
enable_amazon_eks_aws_ebs_csi_driver        = false
enable_self_managed_aws_ebs_csi_driver      = false
amazon_eks_aws_ebs_csi_driver_config        = {}
self_managed_aws_ebs_csi_driver_helm_config = {}

#AGONES
enable_agones      = false
agones_helm_config = {}

#AIRFLOW
enable_airflow      = false
airflow_helm_config = {}

#ARGO-CD
enable_argocd       = true
argocd_helm_config  = {}
argocd_applications = {}

#ARGO-CD ROLLOUTS
enable_argo_rollouts      = false
argo_rollouts_helm_config = ""
argocd_manage_add_ons     = false

#ARGO-CD WORKFLOWS
enable_argo_workflows      = false
argo_workflows_helm_config = ""
#argocd_manage_add_ons            = var.argocd_manage_add_ons

#AWS EFS CSI DIRVER
enable_aws_efs_csi_driver        = false
aws_efs_csi_driver_helm_config   = {}
aws_efs_csi_driver_irsa_policies = []
#argocd_manage_add_ons            = var.argocd_manage_add_ons

#AWS FSX CSI FRIVER
enable_aws_fsx_csi_driver        = false
aws_fsx_csi_driver_helm_config   = {}
aws_fsx_csi_driver_irsa_policies = []
#argocd_manage_add_ons            = var.argocd_manage_add_ons

#AWS FOR FLUENT BIT
enable_aws_for_fluentbit                   = false
aws_for_fluentbit_helm_config              = {}
aws_for_fluentbit_irsa_policies            = []
aws_for_fluentbit_create_cw_log_group      = false
aws_for_fluentbit_cw_log_group_name        = ""
aws_for_fluentbit_cw_log_group_retention   = 1
aws_for_fluentbit_cw_log_group_kms_key_arn = ""
#argocd_manage_add_ons                      = var.argocd_manage_add_ons

#AWS CLOUDWATCH METRICS
enable_aws_cloudwatch_metrics        = false
aws_cloudwatch_metrics_helm_config   = {}
aws_cloudwatch_metrics_irsa_policies = []
#argocd_manage_add_ons                = var.argocd_manage_add_ons

#AWS LOAD BALANCER CONTROLLER
#  custom_image_registry_uri = var.custom_image_registry_uri

enable_aws_load_balancer_controller      = false
aws_load_balancer_controller_helm_config = {}
#  argocd_manage_add_ons                    = var.argocd_manage_add_ons

#AWS NODE TERMINATION HANDLER
enable_aws_node_termination_handler = false
auto_scaling_group_names            = []
#  enable_karpenter                           = var.enable_karpenter
aws_node_termination_handler_helm_config   = {}
aws_node_termination_handler_irsa_policies = []
#  argocd_manage_add_ons                      = var.argocd_manage_add_ons

#APPMESH CONTROLLER
enable_appmesh_controller = false
appmesh_helm_config       = {}
appmesh_irsa_policies     = []

#CERT MANAGER
enable_cert_manager      = false
cert_manager_helm_config = {}
#  argocd_manage_add_ons                          = var.argocd_manage_add_ons
cert_manager_irsa_policies                     = []
cert_manager_domain_names                      = []
cert_manager_install_letsencrypt_issuers       = false
cert_manager_letsencrypt_email                 = ""
cert_manager_kubernetes_svc_image_pull_secrets = []

#CERT MANAGER CSI DRIVER
enable_cert_manager_csi_driver      = false
cert_manager_csi_driver_helm_config = {}
#  argocd_manage_add_ons               = var.argocd_manage_add_ons

#CERT MANAGER ISTIO CSR
enable_cert_manager_istio_csr      = false
cert_manager_istio_csr_helm_config = {}
#  argocd_manage_add_ons              = var.argocd_manage_add_ons

#CLUSTER AUTOSCALER
enable_cluster_autoscaler      = false
cluster_autoscaler_helm_config = {}
#  argocd_manage_add_ons          = var.argocd_manage_add_ons

#COREDNS AUTOSCALER
#  enable_amazon_eks_coredns      = var.enable_amazon_eks_coredns
enable_coredns_autoscaler      = false
coredns_autoscaler_helm_config = {}
#  argocd_manage_add_ons          = var.argocd_manage_add_ons

#CROSSPLANE
enable_crossplane      = false
crossplane_helm_config = {}
crossplane_aws_provider = {
  enable                   = false
  provider_aws_version     = "v0.24.1"
  additional_irsa_policies = []
}
crossplane_jet_aws_provider = {
  enable                   = false
  provider_aws_version     = "v0.24.1"
  additional_irsa_policies = []
}
crossplane_kubernetes_provider = {
  enable                      = false
  provider_kubernetes_version = "v0.4.1"
}

#DATADOG OPERATOR
enable_datadog_operator      = false
datadog_operator_helm_config = {}
#  argocd_manage_add_ons        = var.argocd_manage_add_ons

#FARGATE FLUENTBIT
enable_fargate_fluentbit       = false
fargate_fluentbit_addon_config = {}

#GRAFANA
enable_grafana        = false
grafana_helm_config   = {}
grafana_irsa_policies = []
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#INGRESS NGINX
enable_ingress_nginx      = false
ingress_nginx_helm_config = {}
#  argocd_manage_add_ons     = var.argocd_manage_add_ons

#KARPENTER
enable_karpenter                    = false
karpenter_helm_config               = {}
karpenter_irsa_policies             = []
karpenter_node_iam_instance_profile = ""
karpenter_sqs_queue_arn             = ""
#  argocd_manage_add_ons               = var.argocd_manage_add_ons

#KEDA
enable_keda        = false
keda_helm_config   = {}
keda_irsa_policies = []
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#KUBERNETES DASHBOARD
enable_kubernetes_dashboard      = false
kubernetes_dashboard_helm_config = {}
#  argocd_manage_add_ons            = var.argocd_manage_add_ons

#METRICS SERVER
enable_metrics_server      = false
metrics_server_helm_config = {}
#  argocd_manage_add_ons      = var.argocd_manage_add_ons

#ONDAT
enable_ondat      = false
ondat_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons
ondat_irsa_policies  = []
ondat_create_cluster = false
ondat_etcd_endpoints = []
ondat_etcd_ca        = ""
ondat_etcd_cert      = ""
ondat_etcd_key       = ""
ondat_admin_username = ""
ondat_admin_password = ""

#KUBE PROMETHEUS STACK
enable_kube_prometheus_stack      = false
kube_prometheus_stack_helm_config = {}

#PORTWORX
enable_portworx      = false
portworx_helm_config = {}

#PROMETHEUS
enable_prometheus                    = false
prometheus_helm_config               = {}
enable_amazon_prometheus             = false
amazon_prometheus_workspace_endpoint = ""
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

#RELOADER
enable_reloader      = false
reloader_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#SPARK HISTORY SERVER
enable_spark_history_server      = false
spark_history_server_helm_config = {}
#  argocd_manage_add_ons              = var.argocd_manage_add_ons
spark_history_server_irsa_policies = []
spark_history_server_s3a_path      = ""

#SPARK K8S OPERATOR
enable_spark_k8s_operator      = false
spark_k8s_operator_helm_config = {}
#  argocd_manage_add_ons          = var.argocd_manage_add_ons

#STRIMZI KAFKA OPERATOR
enable_strimzi_kafka_operator      = false
strimzi_kafka_operator_helm_config = {}
#  argocd_manage_add_ons              = var.argocd_manage_add_ons

#SYSDIG AGENT
enable_sysdig_agent      = false
sysdig_agent_helm_config = {}

#TETRATE ISTIO
enable_tetrate_istio              = false
tetrate_istio_distribution        = ""
tetrate_istio_version             = ""
tetrate_istio_install_base        = false
tetrate_istio_install_cni         = false
tetrate_istio_install_istiod      = false
tetrate_istio_install_gateway     = false
tetrate_istio_base_helm_config    = {}
tetrate_istio_cni_helm_config     = {}
tetrate_istio_istiod_helm_config  = {}
tetrate_istio_gateway_helm_config = {}
#  argocd_manage_add_ons             = var.argocd_manage_add_ons

#THANOS
enable_thanos      = false
thanos_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons
thanos_irsa_policies = []

#TRAEFIK
enable_traefik      = false
traefik_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#VAULT
enable_vault      = false
vault_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#VPA
enable_vpa      = false
vpa_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#YUNIKORN
enable_yunikorn      = false
yunikorn_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#CSI SECRETS STORE PROVIDER AWS 
enable_secrets_store_csi_driver_provider_aws = false
csi_secrets_store_provider_aws_helm_config   = {}
#  argocd_manage_add_ons                        = var.argocd_manage_add_ons

#SECRETS STORE CSI DRIVER
enable_secrets_store_csi_driver      = false
secrets_store_csi_driver_helm_config = {}
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

#AWS PRIVATECA ISSUER
enable_aws_privateca_issuer      = false
aws_privateca_issuer_helm_config = {}
#  argocd_manage_add_ons              = var.argocd_manage_add_ons
aws_privateca_acmca_arn            = ""
aws_privateca_issuer_irsa_policies = []

#VELERO
enable_velero      = false
velero_helm_config = {}
#  argocd_manage_add_ons   = var.argocd_manage_add_ons
velero_irsa_policies    = []
velero_backup_s3_bucket = ""

#OPENTELEMETRY OPERATOR
enable_amazon_eks_adot             = false
enable_opentelemetry_operator      = false
eks_cluster_version                = ""
amazon_eks_adot_config             = {}
opentelemetry_operator_helm_config = {}
#  argocd_manage_add_ons              = var.argocd_manage_add_ons

#ADOT COLLECTOR JAVA
enable_adot_collector_java      = false
adot_collector_java_helm_config = {}
#  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
amazon_prometheus_workspace_region = ""
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

#ADOT COLLECTOR HAPROXY
enable_adot_collector_haproxy      = false
adot_collector_haproxy_helm_config = {}
#  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
#  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

#ADOT COLLECTOR MEMCACHED
enable_adot_collector_memcached      = false
adot_collector_memcached_helm_config = {}
#  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
#  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

#ADOT COLLECTOR NGINX
enable_adot_collector_nginx      = false
adot_collector_nginx_helm_config = {}
#  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
#  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

#KUBERAY OPERATOR
enable_kuberay_operator      = false
kuberay_operator_helm_config = {}

#EXTERNAL SECRETS
enable_external_secrets               = false
external_secrets_helm_config          = {}
external_secrets_irsa_policies        = []
external_secrets_ssm_parameter_arns   = []
external_secrets_secrets_manager_arns = []
#  argocd_manage_add_ons                 = var.argocd_manage_add_ons

#PROMTAIL
enable_promtail      = false
promtail_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#CALICO
enable_calico = false
#  promtail_helm_config  = var.promtail_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#KUBECOST
enable_kubecost      = false
kubecost_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#KYVERNO
enable_kyverno                      = false
kyverno_helm_config                 = {}
enable_kyverno_policies             = false
kyverno_policies_helm_config        = {}
enable_kyverno_policy_reporter      = false
kyverno_policy_reporter_helm_config = {}
#  argocd_manage_add_ons               = var.argocd_manage_add_ons

#SMB CSI DRIVER
enable_smb_csi_driver      = false
smb_csi_driver_helm_config = {}
#  argocd_manage_add_ons      = var.argocd_manage_add_ons

#CHAOS MESH
enable_chaos_mesh      = false
chaos_mesh_helm_config = {}
#  argocd_manage_add_ons  = var.argocd_manage_add_ons

#CILIUN
enable_cilium           = false
cilium_helm_config      = {}
cilium_enable_wireguard = false
#  argocd_manage_add_ons   = var.argocd_manage_add_ons

#GATEKEEPER
enable_gatekeeper      = false
gatekeeper_helm_config = {}
#  argocd_manage_add_ons  = var.argocd_manage_add_ons

#LOCAL VOLUME PROVISIONER
enable_local_volume_provisioner      = false
local_volume_provisioner_helm_config = {}

#NVIDIA DEVICE PLUGIN
enable_nvidia_device_plugin      = false
nvidia_device_plugin_helm_config = {}
#  argocd_manage_add_ons            = var.argocd_manage_add_ons

#APP 2048
enable_app_2048 = false

#EMR ON EKS
enable_emr_on_eks     = false
emr_on_eks_config     = {}
eks_oidc_provider_arn = ""
#  argocd_manage_add_ons = var.argocd_manage_add_ons

#CONSUL
enable_consul      = false
consul_helm_config = {}
#  argocd_manage_add_ons = var.argocd_manage_add_ons

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

#Github repository
enable_github_repo    = true #default = false
github_token          = "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"
github_owner          = "armenmelkonyan90"
github_repo_name      = "demo"
github_description    = ""                   #default =   
github_visibility     = "public"             #default =  public 
github_template_owner = "armenmelkonyan90"   #default = null
template_repo_name    = "devops_task_ArgoCD" #default = null

#External dns
enable_external_dns            = false
external_dns_helm_config       = {}
external_dns_irsa_policies     = []
eks_cluster_domain             = "gymops.click"
external_dns_private_zone      = false
external_dns_route53_zone_arns = []
create_route53_zone            = true

