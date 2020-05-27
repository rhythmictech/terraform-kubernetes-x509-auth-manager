
variable "client_certificate" {
  description = "PEM-encoded client certificate for TLS authentication."
  type        = string
}

variable "client_key" {
  description = "PEM-encoded client certificate key for TLS authentication."
  type        = string
}

variable "client_ca_certificate" {
  description = "PEM-encoded root certificates bundle for TLS authentication."
  type        = string
}

variable "host" {
  description = "The hostname (in form of URI) of Kubernetes master."
  type        = string
}

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
  default     = []
  description = "Names of the Users who will have access kubernetes cluster/namespace"
  type        = list(string)
}

variable "namespace_admins_rule" {
  default = {
    api_groups = [""]
    resources  = ["*"]
    verbs      = ["*"]
  }
  description = "APIGroups, resources, and verbs that define the namespace admin access"
  type = object({
    api_groups = list(string)
    resources  = list(string)
    verbs      = list(string)
  })
}

locals {
  client_certificate           = var.client_certificate
  client_key                   = var.client_key
  cluster_ca_certificate       = var.cluster_ca_certificate
  cluster_name                 = var.cluster_name
  host                         = var.host
  kubernetes_role_name         = "${var.name}-${var.namespace}-admin-ro"
  kubernetes_role_binding_name = "${var.name}-${var.namespace}-admin-robind"
  labels = {
    heritage       = "terraform"
    release_target = "${local.name}-${terraform.workspace}"
  }
  name = var.name
  tags = var.tags
}
