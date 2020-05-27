
# lazily defing my vars as locals
locals {
  env       = "sandbox"
  name      = "example"
  owner     = "Rhythmictech"
  namespace = "aws-rhythmic-sandbox"
}

module "tags" {
  source = "git::https://github.com/rhythmictech/terraform-terraform-tags.git?ref=v1.0.0"

  names = [
    local.name,
    local.env,
  ]

  tags = {
    "Env"   = local.env,
    "Owner" = local.owner
  }
}


module "example" {
  # source = "git::https://github.com/rhythmictech/terraform-kubernetes-namespace-admins.git?ref=master
  source = "../.."

  name      = module.tags.name
  namespace = local.namespace
  namespace_admins = [
    "spice",
    "melange",
    "pierre"
  ]
  tags = module.tags.tags
}

output "example" {
  value = module.example
}
