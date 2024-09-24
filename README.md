## Description

Here, In this template we will deploy ALB Controller in AKS through helm, NGINX ingress controller on cloud to run our services through internal loadbalancer.

---

#### Pre-requisite

* AZ Account
* Azure CLI


---

### Steps:-
1. Login into AZ account using `az login` or `az login --tenant <TENANT-ID>`
2. Login into the Azure using the Service Principal the Service Principal like `az service principal -u <client-id> -p <client-password> -t <tenant-ID>`.

---

## Input Variables
The module accepts the following inputs:

| Name                      | Description                                                      | Type          | Default                                      |
|---------------------------|------------------------------------------------------------------|---------------|----------------------------------------------|
| name_VV                   | Name of the local helm repository.                               | string        | "ingress-nginx"                              |
| aks_cluster_VV            | Name of the AKS cluster where chart will be deployed.            | string        | "ems-dev"                                    |
| aks_cluster_group_VV      | Name of the AKS cluster group.                                   | string        | "ems-dev-rg"                                 |
| helm_repo_VV              | Name of the Remote helm repository.                              | string        | "https://kubernetes.github.io/ingress-nginx" |
| helm_chart_VV             | Name of the helm chart to be deployed.                           | string        | "ingress-nginx"                              |
| helm_chart_version_VV     | Version of the helm chart to be deployed.                        | string        | "4.10.1"                                     |
| namespace_VV              | Name of the namespace where chart is deployed.                   | string        | "ingress-nginx"                              |
| create_namespace_VV       | Boolean value for namespace creation.                            | bool          | true                                         |
| set_VV                    | Value block with custom STRING values to merge with values.yaml. | list(object({ name = string, value = string })) | null                                         |
 


### To use multiple nginx ingress controller you can set following variables :

You can deploy two Ingress controllers by granting them control over two different IngressClasses, then selecting one of the two IngressClasses with ingressClassName.

https://kubernetes.github.io/ingress-nginx/user-guide/multiple-ingress/

```
set = [{name  = "controller.service.annotations.\"service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal\"", value = "true"}, {name= "controller.ingressClassResource.name", value = "nginx-internal"}, 
{name = "controller.ingressClass", value = "nginx-internal"}, 
{name = "controller.ingressClassResource.controllerValue", value = "k8s.io/nginx-internal"}, 
{name= "controller.ingressClassResource.default", value = false}, 
{name= "controller.ingressClassResource.enabled", value = true}]

## Change the name as per use case
```

**For creating internal load Balancer (Private LB)**

```
set = [{name  = "controller.service.annotations.\"service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal\"", value = "true"}]

```

**Deploy controller with mutiple pods**

```
set = [{name  = "controller.replicaCount", value = 3}]

```

### To refer this multi-controller you can set following field as per your ingress class name
```
 ingressClassName: "nginx-internal"
```

**Check `examples` folder for sample use cases :**


 
## Outputs

## Output Variables

| Name                      | Description                                                       | Value                                                     |
|---------------------------|-------------------------------------------------------------------|-----------------------------------------------------------|
| chart-name                | Ingress Nginx Controller Chart release name                       | `helm_release.this.metadata[0].name`                      |
| chart-namespace           | Ingress Nginx Controller Chart deployed namespace                 | `helm_release.this.metadata[0].namespace`                 |
| chart-version             | Ingress Nginx Controller Chart deployed version                   | `helm_release.this.metadata[0].version`                   |
| chart-status              | Ingress Nginx Controller Chart Status                             | `helm_release.this.status`                                |
| aks-cluster               | Ingress Nginx Controller Chart deployed AKS Cluster               | `data.azurerm_kubernetes_cluster.aks.name`                |
| aks-cluster-resourcegroup | Ingress Nginx Controller Chart deployed AKS Cluster resourcegroup | `data.azurerm_kubernetes_cluster.aks.resource_group_name` |







