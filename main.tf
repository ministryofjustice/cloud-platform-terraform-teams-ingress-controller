##########
# Locals #
##########

locals {
  external_dns_annotation = "*.${var.hostzone_name},${var.hostzone_name}"
}

########
# Helm #
########

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

resource "helm_release" "nginx" {
  # If we leave ingress-controller-${namespace} we get Error: Service "ingress-controller-starter-pack-nginx-ingress-controller-admission" is invalid: metadata.name: Invalid value: "ingress-controller-starter-pack-nginx-ingress-controller-admission": must be no more than 63 characters
  name       = "ic-${var.namespace}"
  chart      = "nginx-ingress"
  repository = data.helm_repository.stable.metadata[0].name
  version    = "1.35.0"

  namespace = var.namespace

  values = [templatefile("${path.module}/templates/values.yaml.tpl", {
    namespace               = var.namespace
    external_dns_annotation = local.external_dns_annotation
  })]
}

# Default Lets-Encrypt cert 
data "template_file" "nginx_ingress_default_certificate" {
  template = file(
    "${path.module}/templates/default-certificate.yaml.tpl",
  )

  vars = {
    common_name = var.hostzone_name
    namespace   = var.namespace
  }
}

resource "null_resource" "nginx_ingress_default_certificate" {
  provisioner "local-exec" {
    command = <<EOS
kubectl apply -n ${var.namespace} -f - <<EOF
${data.template_file.nginx_ingress_default_certificate.rendered}
EOF
EOS

  }

  provisioner "local-exec" {
    when = destroy

    command = <<EOS
kubectl delete -n ${var.namespace} -f - <<EOF
${data.template_file.nginx_ingress_default_certificate.rendered}
EOF
EOS

  }

  triggers = {
    contents = sha1(
      data.template_file.nginx_ingress_default_certificate.rendered,
    )
  }
}
