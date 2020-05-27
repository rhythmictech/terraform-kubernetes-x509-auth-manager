
variable "name" {
  description = "Moniker to apply to all resources in the module"
  type        = string
}

variable "tags" {
  default     = {}
  description = "User-Defined tags"
  type        = map(string)
}

variable "namespace" {
  description = "Kubernetes namespace to populate"
  type        = string
}

variable "namespace_admins" {
  description = "Names of the Users who will have access kubernetes cluster/namespace"
  type        = list(string)
  default     = []
}


locals {
  client_certificate           = ""
  client_key                   = ""
  cluster_ca_certificate       = ""
  cluster_name                 = ""
  kubernetes_role_name         = ""
  kubernetes_role_binding_name = ""
  labels = {
    name           = var.namespace
    heritage       = "terraform"
    release_target = "eeoc-web-${terraform.workspace}"
  }
  name = module.tags.name
  tags = module.tags.tags_no_name
}
