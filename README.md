# cloud-platform-terraform-ingress-controller

[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-teams-ingress-controller/all.svg?style=flat-square)](https://github.com/ministryofjustice/cloud-platform-terraform-teams-ingress-controller/releases)

Terraform module used by teams to deploy nginx ingress controller in their namespaces

## Usage

```hcl
module "ingress_controller" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-teams-ingress-controller?ref=0.0.1"

  namespace     = "starter-pack"
}
```

## Inputs

| Name       | Description                                                                        | Type   | Default | Required |
|------------|------------------------------------------------------------------------------------|:------:|:-------:|:--------:|
| namespace  | Namespace where ingress controller is going to be looking for ingresses            | string |    ""   |    yes   |

## Outputs

This module doesn't have outputs
