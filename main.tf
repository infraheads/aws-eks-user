module "infraheads_aws_eks" {
  source = "../infraheads_aws_eks"
  # source = "https://github.com/infraheads/infraheads_aws_eks.git"

# EKS CLUSTER

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  # Enter VPC ID
  vpc_id = var.cluster_vpc_id 

  #Subnet IDs
  private_subnet_ids       = var.cluster_private_subnet_ids
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

#EKS ADDONS

  #ADDON CONTEXT  
  eks_cluster_endpoint          = var.eks_cluster_endpoint
  eks_oidc_provider             = var.eks_oidc_provider
  data_plane_wait_arn           = var.data_plane_wait_arn
  eks_cluster_id                = var.eks_cluster_id
  tags                          = var.tags
  irsa_iam_role_path            = var.irsa_iam_role_path
  irsa_iam_permissions_boundary = var.irsa_iam_permissions_boundary

  #AWS VPC CNI
  enable_amazon_eks_vpc_cni = var.enable_amazon_eks_vpc_cni
  enable_ipv6               = var.enable_ipv6
  amazon_eks_vpc_cni_config = var.amazon_eks_vpc_cni_config

  #AWS COREDNS
  custom_image_registry_uri = var.custom_image_registry_uri
  enable_amazon_eks_coredns                           = var.enable_amazon_eks_coredns
  enable_self_managed_coredns                         = var.enable_self_managed_coredns
  amazon_eks_coredns_config                           = var.amazon_eks_coredns_config
  self_managed_coredns_helm_config                    = var.self_managed_coredns_helm_config
  enable_coredns_cluster_proportional_autoscaler      = var.enable_coredns_cluster_proportional_autoscaler
  coredns_cluster_proportional_autoscaler_helm_config = var.coredns_cluster_proportional_autoscaler_helm_config
  remove_default_coredns_deployment                   = var.remove_default_coredns_deployment

  #AWS KUBE PROXY
  enable_amazon_eks_kube_proxy = var.enable_amazon_eks_kube_proxy
  amazon_eks_kube_proxy_config = var.amazon_eks_kube_proxy_config

  #AWS EBS CSI DRIVER
  enable_amazon_eks_aws_ebs_csi_driver        = var.enable_amazon_eks_aws_ebs_csi_driver
  enable_self_managed_aws_ebs_csi_driver      = var.enable_self_managed_aws_ebs_csi_driver
  amazon_eks_aws_ebs_csi_driver_config        = var.amazon_eks_aws_ebs_csi_driver_config
  self_managed_aws_ebs_csi_driver_helm_config = var.self_managed_aws_ebs_csi_driver_helm_config

  #AGONES
  enable_agones      = var.enable_agones
  agones_helm_config = var.agones_helm_config

  #AIRFLOW
  enable_airflow      = var.enable_airflow
  airflow_helm_config = var.airflow_helm_config

  #ARGO-CD
  enable_argocd       = var.enable_argocd
  argocd_helm_config  = var.argocd_helm_config
  argocd_applications = var.argocd_applications

  #ARGO-CD ROLLOUTS
  enable_argo_rollouts      = var.enable_argo_rollouts
  argo_rollouts_helm_config = var.argo_rollouts_helm_config
  argocd_manage_add_ons     = var.argocd_manage_add_ons

  #ARGO-CD WORKFLOWS
  enable_argo_workflows      = var.enable_argo_workflows
  argo_workflows_helm_config = var.argo_workflows_helm_config
  #argocd_manage_add_ons            = var.argocd_manage_add_ons

  #AWS EFS CSI DIRVER
  enable_aws_efs_csi_driver        = var.enable_aws_efs_csi_driver
  aws_efs_csi_driver_helm_config   = var.aws_efs_csi_driver_helm_config
  aws_efs_csi_driver_irsa_policies = var.aws_efs_csi_driver_irsa_policies
  #argocd_manage_add_ons            = var.argocd_manage_add_ons

  #AWS FSX CSI FRIVER
  enable_aws_fsx_csi_driver        = var.enable_aws_fsx_csi_driver
  aws_fsx_csi_driver_helm_config   = var.aws_fsx_csi_driver_helm_config
  aws_fsx_csi_driver_irsa_policies = var.aws_fsx_csi_driver_irsa_policies
  #argocd_manage_add_ons            = var.argocd_manage_add_ons

  #AWS FOR FLUENT BIT
  enable_aws_for_fluentbit                   = var.enable_aws_for_fluentbit
  aws_for_fluentbit_helm_config              = var.aws_for_fluentbit_helm_config
  aws_for_fluentbit_irsa_policies            = var.aws_for_fluentbit_irsa_policies
  aws_for_fluentbit_create_cw_log_group      = var.aws_for_fluentbit_create_cw_log_group
  aws_for_fluentbit_cw_log_group_name        = var.aws_for_fluentbit_cw_log_group_name
  aws_for_fluentbit_cw_log_group_retention   = var.aws_for_fluentbit_cw_log_group_retention
  aws_for_fluentbit_cw_log_group_kms_key_arn = var.aws_for_fluentbit_cw_log_group_kms_key_arn
  #argocd_manage_add_ons                      = var.argocd_manage_add_ons

  #AWS CLOUDWATCH METRICS
  enable_aws_cloudwatch_metrics        = var.enable_aws_cloudwatch_metrics
  aws_cloudwatch_metrics_helm_config   = var.aws_cloudwatch_metrics_helm_config
  aws_cloudwatch_metrics_irsa_policies = var.aws_cloudwatch_metrics_irsa_policies
  #argocd_manage_add_ons                = var.argocd_manage_add_ons

  #AWS LOAD BALANCER CONTROLLER
#  custom_image_registry_uri = var.custom_image_registry_uri

  enable_aws_load_balancer_controller      = var.enable_aws_load_balancer_controller
  aws_load_balancer_controller_helm_config = var.aws_load_balancer_controller_helm_config
#  argocd_manage_add_ons                    = var.argocd_manage_add_ons

  #AWS NODE TERMINATION HANDLER
  enable_aws_node_termination_handler        = var.enable_aws_node_termination_handler
  auto_scaling_group_names                   = var.auto_scaling_group_names
#  enable_karpenter                           = var.enable_karpenter
  aws_node_termination_handler_helm_config   = var.aws_node_termination_handler_helm_config
  aws_node_termination_handler_irsa_policies = var.aws_node_termination_handler_irsa_policies
#  argocd_manage_add_ons                      = var.argocd_manage_add_ons

  #APPMESH CONTROLLER
  enable_appmesh_controller = var.enable_appmesh_controller
  appmesh_helm_config       = var.appmesh_helm_config
  appmesh_irsa_policies     = var.appmesh_irsa_policies

  #CERT MANAGER
  enable_cert_manager                            = var.enable_cert_manager
  cert_manager_helm_config                       = var.cert_manager_helm_config
#  argocd_manage_add_ons                          = var.argocd_manage_add_ons
  cert_manager_irsa_policies                     = var.cert_manager_irsa_policies
  cert_manager_domain_names                      = var.cert_manager_domain_names
  cert_manager_install_letsencrypt_issuers       = var.cert_manager_install_letsencrypt_issuers
  cert_manager_letsencrypt_email                 = var.cert_manager_letsencrypt_email
  cert_manager_kubernetes_svc_image_pull_secrets = var.cert_manager_kubernetes_svc_image_pull_secrets

  #CERT MANAGER CSI DRIVER
  enable_cert_manager_csi_driver      = var.enable_cert_manager_csi_driver
  cert_manager_csi_driver_helm_config = var.cert_manager_csi_driver_helm_config
#  argocd_manage_add_ons               = var.argocd_manage_add_ons

  #CERT MANAGER ISTIO CSR
  enable_cert_manager_istio_csr      = var.enable_cert_manager_istio_csr
  cert_manager_istio_csr_helm_config = var.cert_manager_istio_csr_helm_config
#  argocd_manage_add_ons              = var.argocd_manage_add_ons

  #CLUSTER AUTOSCALER
  enable_cluster_autoscaler      = var.enable_cluster_autoscaler
  cluster_autoscaler_helm_config = var.cluster_autoscaler_helm_config
#  argocd_manage_add_ons          = var.argocd_manage_add_ons

  #COREDNS AUTOSCALER
#  enable_amazon_eks_coredns      = var.enable_amazon_eks_coredns
  enable_coredns_autoscaler      = var.enable_coredns_autoscaler
  coredns_autoscaler_helm_config = var.coredns_autoscaler_helm_config
#  argocd_manage_add_ons          = var.argocd_manage_add_ons

  #CROSSPLANE
  enable_crossplane              = var.enable_crossplane
  crossplane_helm_config         = var.crossplane_helm_config
  crossplane_aws_provider        = var.crossplane_aws_provider
  crossplane_jet_aws_provider    = var.crossplane_jet_aws_provider
  crossplane_kubernetes_provider = var.crossplane_kubernetes_provider

  #DATADOG OPERATOR
  enable_datadog_operator      = var.enable_datadog_operator
  datadog_operator_helm_config = var.datadog_operator_helm_config
#  argocd_manage_add_ons        = var.argocd_manage_add_ons

  #EXTERNAL DNS
  enable_external_dns              = VAR.enable_external_dns
  external_dns_helm_config         = var.external_dns_helm_config
#  argocd_manage_add_ons   = var.argocd_manage_add_ons
  external_dns_irsa_policies       = var.external_dns_irsa_policies
  eks_cluster_domain_name          = var.eks_cluster_domain_name
  external_dns_private_zone        = var.external_dns_private_zone
  create_route53_zone              = var.create_route53_zone
  external_dns_route53_zone_arns   = var.external_dns_route53_zone_arns

  #FARGATE FLUENTBIT
  enable_fargate_fluentbit       = var.enable_fargate_fluentbit
  fargate_fluentbit_addon_config = var.fargate_fluentbit_addon_config

  #GRAFANA
  enable_grafana        = var.enable_grafana
  grafana_helm_config   = var.grafana_helm_config
  grafana_irsa_policies = var.grafana_irsa_policies
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #INGRESS NGINX
  enable_ingress_nginx      = var.enable_ingress_nginx
  ingress_nginx_helm_config = var.ingress_nginx_helm_config
#  argocd_manage_add_ons     = var.argocd_manage_add_ons

  #KARPENTER
  enable_karpenter                    = var.enable_karpenter
  karpenter_helm_config               = var.karpenter_helm_config
  karpenter_irsa_policies             = var.karpenter_irsa_policies
  karpenter_node_iam_instance_profile = var.karpenter_node_iam_instance_profile
  karpenter_sqs_queue_arn             = var.karpenter_sqs_queue_arn
#  argocd_manage_add_ons               = var.argocd_manage_add_ons

  #KEDA
  enable_keda           = var.enable_keda
  keda_helm_config      = var.keda_helm_config
  keda_irsa_policies    = var.keda_irsa_policies
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #KUBERNETES DASHBOARD
  enable_kubernetes_dashboard      = var.enable_kubernetes_dashboard
  kubernetes_dashboard_helm_config = var.kubernetes_dashboard_helm_config
#  argocd_manage_add_ons            = var.argocd_manage_add_ons

  #METRICS SERVER
  enable_metrics_server      = var.enable_metrics_server
  metrics_server_helm_config = var.metrics_server_helm_config
#  argocd_manage_add_ons      = var.argocd_manage_add_ons

  #ONDAT
  enable_ondat          = var.enable_ondat
  ondat_helm_config     = var.ondat_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons
  ondat_irsa_policies   = var.ondat_irsa_policies
  ondat_create_cluster  = var.ondat_create_cluster
  ondat_etcd_endpoints  = var.ondat_etcd_endpoints
  ondat_etcd_ca         = var.ondat_etcd_ca
  ondat_etcd_cert       = var.ondat_etcd_cert
  ondat_etcd_key        = var.ondat_etcd_key
  ondat_admin_username  = var.ondat_admin_username
  ondat_admin_password  = var.ondat_admin_password

  #KUBE PROMETHEUS STACK
  enable_kube_prometheus_stack      = var.enable_kube_prometheus_stack
  kube_prometheus_stack_helm_config = var.kube_prometheus_stack_helm_config

  #PORTWORX
  enable_portworx      = var.enable_portworx
  portworx_helm_config = var.portworx_helm_config

  #PROMETHEUS
  enable_prometheus                    = var.enable_prometheus
  prometheus_helm_config               = var.prometheus_helm_config
  enable_amazon_prometheus             = var.enable_amazon_prometheus
  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

  #RELOADER
  enable_reloader       = var.enable_reloader
  reloader_helm_config  = var.reloader_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #SPARK HISTORY SERVER
  enable_spark_history_server        = var.enable_spark_history_server
  spark_history_server_helm_config   = var.spark_history_server_helm_config
#  argocd_manage_add_ons              = var.argocd_manage_add_ons
  spark_history_server_irsa_policies = var.spark_history_server_irsa_policies
  spark_history_server_s3a_path      = var.spark_history_server_s3a_path

  #SPARK K8S OPERATOR
  enable_spark_k8s_operator      = var.enable_spark_k8s_operator
  spark_k8s_operator_helm_config = var.spark_k8s_operator_helm_config
#  argocd_manage_add_ons          = var.argocd_manage_add_ons

  #STRIMZI KAFKA OPERATOR
  enable_strimzi_kafka_operator      = var.enable_strimzi_kafka_operator
  strimzi_kafka_operator_helm_config = var.strimzi_kafka_operator_helm_config
#  argocd_manage_add_ons              = var.argocd_manage_add_ons

  #SYSDIG AGENT
  enable_sysdig_agent      = var.enable_sysdig_agent
  sysdig_agent_helm_config = var.sysdig_agent_helm_config

  #TETRATE ISTIO
  enable_tetrate_istio              = var.enable_tetrate_istio
  tetrate_istio_distribution        = var.tetrate_istio_distribution
  tetrate_istio_version             = var.tetrate_istio_version
  tetrate_istio_install_base        = var.tetrate_istio_install_base
  tetrate_istio_install_cni         = var.tetrate_istio_install_cni
  tetrate_istio_install_istiod      = var.tetrate_istio_install_istiod
  tetrate_istio_install_gateway     = var.tetrate_istio_install_gateway
  tetrate_istio_base_helm_config    = var.tetrate_istio_base_helm_config
  tetrate_istio_cni_helm_config     = var.tetrate_istio_cni_helm_config
  tetrate_istio_istiod_helm_config  = var.tetrate_istio_istiod_helm_config
  tetrate_istio_gateway_helm_config = var.tetrate_istio_gateway_helm_config
#  argocd_manage_add_ons             = var.argocd_manage_add_ons

  #THANOS
  enable_thanos         = var.enable_thanos
  thanos_helm_config    = var.thanos_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons
  thanos_irsa_policies  = var.thanos_irsa_policies

  #TRAEFIK
  enable_traefik        = var.enable_traefik
  traefik_helm_config   = var.traefik_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #VAULT
  enable_vault          = var.enable_vault
  vault_helm_config     = var.vault_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #VPA
  enable_vpa            = var.enable_vpa
  vpa_helm_config       = var.vpa_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #YUNIKORN
  enable_yunikorn       = var.enable_yunikorn
  yunikorn_helm_config  = var.yunikorn_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #CSI SECRETS STORE PROVIDER AWS 
  enable_secrets_store_csi_driver_provider_aws = var.enable_secrets_store_csi_driver_provider_aws
  csi_secrets_store_provider_aws_helm_config   = var.csi_secrets_store_provider_aws_helm_config
#  argocd_manage_add_ons                        = var.argocd_manage_add_ons

  #SECRETS STORE CSI DRIVER
  enable_secrets_store_csi_driver      = var.enable_secrets_store_csi_driver
  secrets_store_csi_driver_helm_config = var.secrets_store_csi_driver_helm_config
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

  #AWS PRIVATECA ISSUER
  enable_aws_privateca_issuer        = var.enable_aws_privateca_issuer
  aws_privateca_issuer_helm_config   = var.aws_privateca_issuer_helm_config
#  argocd_manage_add_ons              = var.argocd_manage_add_ons
  aws_privateca_acmca_arn            = var.aws_privateca_acmca_arn
  aws_privateca_issuer_irsa_policies = var.aws_privateca_issuer_irsa_policies

  #VELERO
  enable_velero           = var.enable_velero
  velero_helm_config      = var.velero_helm_config
#  argocd_manage_add_ons   = var.argocd_manage_add_ons
  velero_irsa_policies    = var.velero_irsa_policies
  velero_backup_s3_bucket = var.velero_backup_s3_bucket

  #OPENTELEMETRY OPERATOR
  enable_amazon_eks_adot             = var.enable_amazon_eks_adot
  enable_opentelemetry_operator      = var.enable_opentelemetry_operator
  eks_cluster_version                = var.eks_cluster_version
  amazon_eks_adot_config             = var.amazon_eks_adot_config
  opentelemetry_operator_helm_config = var.opentelemetry_operator_helm_config
#  argocd_manage_add_ons              = var.argocd_manage_add_ons

  #ADOT COLLECTOR JAVA
  enable_adot_collector_java           = var.enable_adot_collector_java
  adot_collector_java_helm_config      = var.adot_collector_java_helm_config
#  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

  #ADOT COLLECTOR HAPROXY
  enable_adot_collector_haproxy        = var.enable_adot_collector_haproxy
  adot_collector_haproxy_helm_config   = var.adot_collector_haproxy_helm_config
#  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
#  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

  #ADOT COLLECTOR MEMCACHED
  enable_adot_collector_memcached      = var.enable_adot_collector_memcached
  adot_collector_memcached_helm_config = var.adot_collector_memcached_helm_config
#  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
#  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

  #ADOT COLLECTOR NGINX
  enable_adot_collector_nginx          = var.enable_adot_collector_nginx
  adot_collector_nginx_helm_config     = var.adot_collector_nginx_helm_config
#  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
#  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
#  argocd_manage_add_ons                = var.argocd_manage_add_ons

  #KUBERAY OPERATOR
  enable_kuberay_operator      = var.enable_kuberay_operator
  kuberay_operator_helm_config = var.kuberay_operator_helm_config

  #EXTERNAL SECRETS
  enable_external_secrets               = var.enable_external_secrets
  external_secrets_helm_config          = var.external_secrets_helm_config
  external_secrets_irsa_policies        = var.external_secrets_irsa_policies
  external_secrets_ssm_parameter_arns   = var.external_secrets_ssm_parameter_arns
  external_secrets_secrets_manager_arns = var.external_secrets_secrets_manager_arns
#  argocd_manage_add_ons                 = var.argocd_manage_add_ons

  #PROMTAIL
  enable_promtail       = var.enable_promtail
  promtail_helm_config  = var.promtail_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons
  
  #CALICO
  enable_calico         = var.enable_calico
#  promtail_helm_config  = var.promtail_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #KUBECOST
  enable_kubecost       = var.enable_kubecost
  kubecost_helm_config  = var.kubecost_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #KYVERNO
  enable_kyverno                      = var.enable_kyverno
  kyverno_helm_config                 = var.kyverno_helm_config
  enable_kyverno_policies             = var.enable_kyverno_policies
  kyverno_policies_helm_config        = var.kyverno_policies_helm_config
  enable_kyverno_policy_reporter      = var.enable_kyverno_policy_reporter
  kyverno_policy_reporter_helm_config = var.kyverno_policy_reporter_helm_config
#  argocd_manage_add_ons               = var.argocd_manage_add_ons

  #SMB CSI DRIVER
  enable_smb_csi_driver      = var.enable_smb_csi_driver
  smb_csi_driver_helm_config = var.smb_csi_driver_helm_config
#  argocd_manage_add_ons      = var.argocd_manage_add_ons

  #CHAOS MESH
  enable_chaos_mesh      = var.enable_chaos_mesh
  chaos_mesh_helm_config = var.chaos_mesh_helm_config
#  argocd_manage_add_ons  = var.argocd_manage_add_ons

  #CILIUN
  enable_cilium           = var.enable_cilium
  cilium_helm_config      = var.cilium_helm_config
  cilium_enable_wireguard = var.cilium_enable_wireguard
#  argocd_manage_add_ons   = var.argocd_manage_add_ons

  #GATEKEEPER
  enable_gatekeeper      = var.enable_gatekeeper
  gatekeeper_helm_config = var.gatekeeper_helm_config
#  argocd_manage_add_ons  = var.argocd_manage_add_ons

  #LOCAL VOLUME PROVISIONER
  enable_local_volume_provisioner      = var.enable_local_volume_provisioner
  local_volume_provisioner_helm_config = var.local_volume_provisioner_helm_config

  #NVIDIA DEVICE PLUGIN
  enable_nvidia_device_plugin      = var.enable_nvidia_device_plugin
  nvidia_device_plugin_helm_config = var.nvidia_device_plugin_helm_config
#  argocd_manage_add_ons            = var.argocd_manage_add_ons

  #APP 2048
  enable_app_2048 = var.enable_app_2048

  #EMR ON EKS
  emr_on_eks_config     = var.emr_on_eks_config
  enable_emr_on_eks     = var.enable_emr_on_eks
  eks_oidc_provider_arn = var.eks_oidc_provider_arn
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #CONSUL
  enable_consul         = var.enable_consul
  consul_helm_config    = var.consul_helm_config
#  argocd_manage_add_ons = var.argocd_manage_add_ons

  #ARGO-CD APPS 
  enable_argocd_apps        = var.enable_argocd_apps
  argocd_apps_chart_repo    = var.argocd_apps_chart_repo
  argocd_apps_chart_name    = var.argocd_apps_chart_name
  argocd_apps_chart_version = var.argocd_apps_chart_version
  argocd_apps_namespace     = var.argocd_apps_namespace

  argocd_apps_name                   = var.argocd_apps_name
  argocd_apps_project                = var.argocd_apps_project
  argocd_apps_source_repo            = var.argocd_apps_source_repo
  argocd_apps_source_target_revision = var.argocd_apps_source_target_revision
  argocd_apps_source_target_path     = var.argocd_apps_source_target_path
  argocd_apps_source_target_recurse  = var.argocd_apps_source_target_recurse
  argocd_apps_destination_namespace  = var.argocd_apps_destination_namespace
  argocd_apps_prune                  = var.argocd_apps_prune
  argocd_apps_self_heal              = var.argocd_apps_self_heal
  argocd_apps_values                 = var.argocd_apps_values

  #GITHUB REPO
  enable_github_repo = var.enable_github_repo
  github_repo_name   = var.github_repo_name
  description        = var.github_description
  visibility         = var.github_visibility
  template_owner     = var.github_template_owner
  template_repo_name = var.github_template_repo_name
}
