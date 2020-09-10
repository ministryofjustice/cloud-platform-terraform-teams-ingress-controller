
variable "namespace" {
  type        = string
  description = "Namespace where the nginx ingress controller is going to be deployed"
}

variable "custom_values" {
  type        = bool
  description = "Set to true if you do not want to use the default values.yaml provided, fill custom_values_content variable with your custom values"
  default     = false
}

variable "custom_values_content" {
  type        = string
  description = "Namespace where the nginx ingress controller is going to be deployed"
  default     = ""
}

variable "default_cert" {
  type        = string
  description = "Useful if you want to use a default certificate for your ingress controller. Format: namespace/secretName"
  default     = "ingress-controllers/default-certificate"
}

variable "is_production" {
  type        = bool
  description = "If set to true: 2 ingress controller replicas are going to be deployed. Default: 1 replica"
  default     = false
}

variable "dependence_prometheus" {
  type        = string
  description = "When deployed cloud-platform-components integration_test nginx ingress controller, if prometheus is not deployed first it fails because it installs serviceMonitor (CRD from prometheus)"
  default     = "NOTHING"
}

variable "dependence_certmanager" {
  type        = string
  description = "When deployed integration_test nginx ingress controller, if certmanager is not deployed before this module fails because it uses certmanager defaultCertificate"
  default     = "NOTHING"
}
