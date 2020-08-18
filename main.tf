########
# Helm #
########

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

resource "helm_release" "nginx" {
  # If we leave ingress-controller-${namespace} we get Error: Service "ingress-controller-starter-pack-nginx-ingress-controller-admission" is invalid: metadata.name: Invalid value: "ingress-controller-starter-pack-nginx-ingress-controller-admission": must be no more than 63 characters
  name       = var.namespace
  chart      = "nginx-ingress"
  repository = data.helm_repository.stable.metadata[0].name
  version    = "1.35.0"

  namespace = "ingress-controllers"

  values = [templatefile("${path.module}/templates/values.yaml.tpl", {
    namespace             = var.namespace
    custom_values         = var.custom_values
    custom_values_content = var.custom_values_content
    default_cert          = var.default_cert
  })]
}
