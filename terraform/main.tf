terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

# Provider configuration for Azure
provider "azurerm" {
  features {}
}

# ------------------------------
# Resource Group
# ------------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

# ------------------------------
# Log Analytics Workspace
# ------------------------------
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.law_sku
}

# ------------------------------
# Azure Container Registry
# ------------------------------
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.acr_sku
  admin_enabled       = true
}

# ------------------------------
# AKS Cluster
# ------------------------------
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_dns_prefix

  # Congigure the default node pool
  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  # Use system-assigned managed identity
  identity {
    type = "SystemAssigned"
  }

  # Enable Container Insights via OMS agent for monitoring
  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
    }
  }
}
