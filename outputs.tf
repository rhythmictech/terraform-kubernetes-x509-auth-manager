
output "namespace" {
  description = "Kubernetes namespace"
  value       = kubernetes_namespace.this
}

output "user_kubeconfigs" {
  description = "User Kubeconfig yaml files"
  value       = [for file in local_file.user_kubeconfigs : file.content]
}

output "kubernetes_role" {
  description = "The role applied to these users"
  value       = kubernetes_role.namespace_admin
}
