data "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_VV
  resource_group_name = var.aks_cluster_group_VV
}

resource "helm_release" "this" {
  name             = var.name_VV
  repository       = var.helm_repo_VV
  chart            = var.helm_chart_VV
  version          = var.helm_chart_version_VV
  namespace        = var.namespace_VV
  create_namespace = var.create_namespace_VV

  dynamic "set" {
    iterator = item
    for_each = var.set_VV == null ? [] : var.set_VV

    content {
      name  = item.value.name
      value = item.value.value
    }
  }

}