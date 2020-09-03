########
# Helm #
########

data "helm_repository" "ingress-nginx" {
  name = "ingress-nginx"
  url  = "https://kubernetes.github.io/ingress-nginx"
}

resource "helm_release" "nginx" {
  # If we leave ingress-controller-${namespace} we get Error: Service "ingress-controller-starter-pack-nginx-ingress-controller-admission" is invalid: metadata.name: Invalid value: "ingress-controller-starter-pack-nginx-ingress-controller-admission": must be no more than 63 characters
  name       = var.namespace
  chart      = "ingress-nginx"
  repository = data.helm_repository.ingress-nginx.metadata[0].name
  version    = "2.13.0"

  namespace = "ingress-controllers"

  values = [templatefile("${path.module}/templates/values.yaml.tpl", {
    namespace             = var.namespace
    custom_values         = var.custom_values
    custom_values_content = var.custom_values_content
    default_cert          = var.default_cert
    replicaCount          = var.is_production ? 2 : 1
  })]
}
