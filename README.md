# cloud-platform-terraform-ingress-controller

Terraform module used by teams to deploy nginx ingress controller in their namespaces

## Usage

```hcl
module "ingress_controller" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-teams-ingress-controller?ref=0.0.1"

  namespace     = "starter-pack"
  hostzone_name = "mogaal.cloud-platform.service.justice.gov.uk"
}
```

## Inputs

| Name             | Description                                                   | Type | Default | Required |
|------------------|---------------------------------------------------------------|:----:|:-------:|:--------:|
| hostzone_name    | Hostzone name used by certmanager to generate the default certificate for nginx. e.g: cloud-platform.service.justice.gov.uk (NOTE: Do not include HTTP(s))                 | string   |   ""  | yes |
| namespace        | Namespace where the nginx ingress controller is going to be deployed   | string   |   ""  | yes |

## Outputs

This module doesn't have outputs
