
variable "name_VV" {
  type        = string
  description = "Name of the local helm repository."
  default     = "ingress-nginx-controller"
}

variable "aks_cluster_VV" {
  type        = string
  description = "Name of the AKS cluster where chart will be deployed."
}

variable "aks_cluster_group_VV" {
  type        = string
  description = "Name of the AKS cluster group."
}

variable "helm_repo_VV" {
  type        = string
  description = "Name of the Remote helm repository."
  default     = "https://kubernetes.github.io/ingress-nginx"
}

variable "helm_chart_VV" {
  type        = string
  description = "Name of the helm chart to be deployed."
  default     = "ingress-nginx"
}

variable "helm_chart_version_VV" {
  type    = string
  default = "4.10.1"
}

variable "namespace_VV" {
  type        = string
  description = "Name of the namespace where chart is deployed"
  default     = "ingress-nginx"
}

variable "create_namespace_VV" {
  type        = bool
  description = "Boolean value for namespace. It should be created or not."
  default     = true
}

variable "set_VV" {
  description = "Value block with custom STRING values to be merged with the values yaml."
  type = list(object({
    name  = string
    value = string
  }))
  default = null
}