# lazily defing my vars as locals
locals {
  env       = "sandbox"
  name      = "example"
  owner     = "Rhythmictech"
  namespace = "azure-rhythmic-sandbox"
}

variable "client_certificate" {}
variable "client_key" {}
variable "cluster_ca_certificate" {}
variable "host" {}

module "admins" {
  # source = "git::https://github.com/rhythmictech/terraform-kubernetes-namespace-admins.git?ref=master
  source = "../.."

  client_certificate     = var.client_certificate
  client_key             = var.client_key
  cluster_ca_certificate = var.cluster_ca_certificate
  cluster_name           = local.name
  host                   = var.host
  name                   = local.name
  namespace              = local.namespace
  namespace_admins = [
    "spice",
    "melange",
    "pierre"
  ]
}

# output "example" {
#   value = module.example
# }
