provider "aws" {
  region = "eu-west-2"
}


provider "helm" {
  version = "1.1.0"
  kubernetes {
  }
}

module "ingress_controller" {
  source = "../"

  namespace = "mogaal-test"
}
