output "chart-name" {
  description = "Ingress Nginx Chart release name"
  value       = helm_release.this.metadata[0].name
}

output "chart-namespace" {
  description = "Ingress Nginx Chart deployed namespace"
  value       = helm_release.this.metadata[0].namespace
}

output "chart-version" {
  description = "Ingress Nginx deployed version"
  value       = helm_release.this.metadata[0].version
}

output "chart-status" {
  description = "Ingress Nginx Chart Status"
  value       = helm_release.this.status
}

output "aks-cluster" {
  description = "Ingress Nginx Chart deployed AKS Cluster"
  value       = data.azurerm_kubernetes_cluster.aks.name
}

output "aks-cluster-resourcegroup" {
  description = "Ingress Nginx Chart deployed AKS Cluster resourcegroup"
  value       = data.azurerm_kubernetes_cluster.aks.resource_group_name
}