# cloud-platform-terraform-ingress-controller

Terraform module used by teams to deploy nginx ingress controller in their namespaces

## Usage

```hcl
module "ingress_controller" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-teams-ingress-controller?ref=0.0.1"

  namespace     = "starter-pack"
}
```

## Inputs

| Name                   | Description                                                                        | Type   | Default | Required |
|------------------------|------------------------------------------------------------------------------------|:------:|:-------:|:--------:|
| namespace              | Namespace where ingress controller is going to be looking for ingresses            | string |    ""   |    yes   |
| custom_values          | Set to true if you do not want to use the default values.yaml provided, fill custom_values_content variable with your custom values  | bool |    ""   |    yes   |
| custom_values_content  | Provide `values.yaml` content for custom configuration                             | string |    ""   |    yes   |
| default_cert           | Useful if you want to use a default certificate for your ingress controller. Format: namespace/secretName"  | string |    ""   |    yes   |
| is_production          | If set to true: 2 ingress controller replicas are going to be deployed. Default: 1 replica | bool |  false   |  no   |

## Outputs

This module doesn't have outputs
