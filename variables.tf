
variable "namespace" {
  description = "Namespace where the nginx ingress controller is going to be deployed"
  default     = ""
}

variable "hostzone_name" {
  description = "Hostzone name used by certmanager to generate the default certificate for nginx. e.g: cloud-platform.service.justice.gov.uk (NOTE: Do not include HTTP(s))"
  default     = ""
}
