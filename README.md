# terraform-kubernetes-x509-auth-manager [![](https://github.com/rhythmictech/terraform-kubernetes-x509-auth-manager/workflows/pre-commit-check/badge.svg)](https://github.com/rhythmictech/terraform-kubernetes-x509-auth-manager/actions) <a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=RhythmicTech" alt="follow on Twitter"></a>
Create kubeconfig files and delegate access to clusters using x509 authentication.

## Example
Here's what using the module will look like
```hcl
module "example" {
  source  = "rhythmictech/x509-auth-manager/kubernetes
  version = "v1.0.0

  cluster_ca_certificate = "L0NGh@sH"
  cluster_name           = "rhythmic-canary-cluster"
  host                   = "https://rhythmic-canary-cluster.hcp.eastus.azmk8s.io:443"
  name                   = "ultraspice"
  namespace              = "the_test_spice"
  namespace_admins = [
    "spice",
    "melange",
    "pierre",
    "thespice"
  ]
}
```

## About
This code started as a one-off usecase we had at @rhythmic where we needed to delegate access to an old AKS cluster. It was interesting enough to get turned into a blog post/terraform module! You can check it out here: [rhythmictech.com/blog/generating-new-kubernetes-users-with-terraform/](https://www.rhythmictech.com/blog/generating-new-kubernetes-users-with-terraform/)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 1.11.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 1.4 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 1.11.0 |
| <a name="provider_local"></a> [local](#provider\_local) | ~> 1.4 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~> 2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_role.namespace_admin](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role) | resource |
| [kubernetes_role_binding.namespace_admin](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [local_file.csr_requests](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.user_kubeconfigs](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_cert_request.client_csr](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_private_key.client_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [local_file.client_crt](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | PEM-encoded root certificates bundle for TLS authentication. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the K8s cluster | `string` | n/a | yes |
| <a name="input_host"></a> [host](#input\_host) | The hostname (in form of URI) of Kubernetes master. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Moniker to apply to all resources in the module | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace to populate | `string` | n/a | yes |
| <a name="input_kubeconfig_file_name"></a> [kubeconfig\_file\_name](#input\_kubeconfig\_file\_name) | Path to kubeconfig file used to request CSR approval | `string` | `"~/.kube/config"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | User-Defined labels for k8s resources | `map(string)` | `{}` | no |
| <a name="input_namespace_admins"></a> [namespace\_admins](#input\_namespace\_admins) | Names of the Users who will have access kubernetes cluster/namespace | `list(string)` | `[]` | no |
| <a name="input_namespace_admins_rule"></a> [namespace\_admins\_rule](#input\_namespace\_admins\_rule) | APIGroups, resources, and verbs that define the namespace admin access | <pre>object({<br>    api_groups = list(string)<br>    resources  = list(string)<br>    verbs      = list(string)<br>  })</pre> | <pre>{<br>  "api_groups": [<br>    ""<br>  ],<br>  "resources": [<br>    "*"<br>  ],<br>  "verbs": [<br>    "*"<br>  ]<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_role"></a> [kubernetes\_role](#output\_kubernetes\_role) | The role applied to these users |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Kubernetes namespace |
| <a name="output_user_kubeconfigs"></a> [user\_kubeconfigs](#output\_user\_kubeconfigs) | User Kubeconfig yaml files |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## The Giants underneath this module
- pre-commit.com/
- terraform.io/
- github.com/tfutils/tfenv
- github.com/segmentio/terraform-docs
