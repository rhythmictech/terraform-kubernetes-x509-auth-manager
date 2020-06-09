
variable "cluster_ca_certificate" {
  description = "PEM-encoded root certificates bundle for TLS authentication."
  type        = string
}

variable "cluster_name" {
  description = "Name of the K8s cluster"
  type        = string
}

variable "host" {
  description = "The hostname (in form of URI) of Kubernetes master."
  type        = string
}

variable "kubeconfig_file_name" {
  default     = "~/.kube/config"
  description = "Path to kubeconfig file used to request CSR approval"
  type        = string
}

variable "name" {
  description = "Moniker to apply to all resources in the module"
  type        = string
}

variable "labels" {
  default     = {}
  description = "User-Defined labels for k8s resources"
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
  csr_request_template_path = "${path.module}/csr_requests/"
  # for the users kubeconfig files
  kubernetes_role_name         = "${var.name}-${var.namespace}-admin-ro"
  kubernetes_role_binding_name = "${var.name}-${var.namespace}-admin-robind"
  labels = merge(var.labels, {
    heritage       = "terraform"
    release_target = "${var.name}-${terraform.workspace}"
  })
}
