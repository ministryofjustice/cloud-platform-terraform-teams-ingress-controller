
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
  default     = ""
}

variable "is_prod" {
  type        = bool
  description = "If set to true: 2 ingress controller replicas are going to be deployed. Default: 1 replica"
  default     = false
}
