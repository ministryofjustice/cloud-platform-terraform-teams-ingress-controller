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

#module "ingress_controller" {
#  source = "../"
#
#  namespace = "mogaal-test"
#  custom_values = true
#  custom_values_content = <<EOF
#This is a long key.
#Running over several lines.
#EOF
#}
