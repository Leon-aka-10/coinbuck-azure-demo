#-----------------------------
#Outputs for Reference
#-----------------------------

output "resource_group_name" {
  description = "The name of the Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "acr_login_server" {
  description = "Login server URL of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_kube_config" {
  description = "Kubeconfig to connect to AKS"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.law.id
}
