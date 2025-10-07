# General
variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "West Europe"
}

# Resource Group
variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "rg-coinbuck"
}

# Log Analytics
variable "law_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
  default     = "law-coinbuck"
}

variable "law_sku" {
  description = "SKU for Log Analytics"
  type        = string
  default     = "PerGB2018"
}

# Azure Container Registry
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "acrcoinbuckdemo"
}

variable "acr_sku" {
  description = "SKU for ACR"
  type        = string
  default     = "Basic"
}

# AKS Cluster
variable "aks_name" {
  description = "Name of the AKS Cluster"
  type        = string
  default     = "aks-coinbuck"
}

variable "aks_dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
  default     = "coinbuckdemo"
}

variable "node_pool_name" {
  description = "Default node pool name"
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "Number of nodes in default pool"
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "VM size for nodes"
  type        = string
  default     = "Standard_B2s"
}