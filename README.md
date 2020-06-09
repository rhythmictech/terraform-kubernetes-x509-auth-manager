# terraform-kubernetes-x509-auth-manager [![](https://github.com/rhythmictech/terraform-kubernetes-x509-auth-manager/workflows/pre-commit-check/badge.svg)](https://github.com/rhythmictech/terraform-kubernetes-x509-auth-manager/actions) <a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=RhythmicTech" alt="follow on Twitter"></a>
Create kubeconfig files that give the user access over a namespace

## Example
Here's what using the module will look like
```hcl
module "example" {
  source  = "rhythmictech/x509-auth-manager/kubernetes
  version = "v1.0.0
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| kubernetes | ~> 1.11.0 |
| local | ~> 1.4 |
| tls | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | ~> 1.11.0 |
| local | ~> 1.4 |
| tls | ~> 2.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_ca\_certificate | PEM-encoded root certificates bundle for TLS authentication. | `string` | n/a | yes |
| cluster\_name | Name of the K8s cluster | `string` | n/a | yes |
| host | The hostname (in form of URI) of Kubernetes master. | `string` | n/a | yes |
| name | Moniker to apply to all resources in the module | `string` | n/a | yes |
| namespace | Kubernetes namespace to populate | `string` | n/a | yes |
| kubeconfig\_file\_name | Path to kubeconfig file used to request CSR approval | `string` | `"~/.kube/config"` | no |
| labels | User-Defined labels for k8s resources | `map(string)` | `{}` | no |
| namespace\_admins | Names of the Users who will have access kubernetes cluster/namespace | `list(string)` | `[]` | no |
| namespace\_admins\_rule | APIGroups, resources, and verbs that define the namespace admin access | <pre>object({<br>    api_groups = list(string)<br>    resources  = list(string)<br>    verbs      = list(string)<br>  })</pre> | <pre>{<br>  "api_groups": [<br>    ""<br>  ],<br>  "resources": [<br>    "*"<br>  ],<br>  "verbs": [<br>    "*"<br>  ]<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| kubernetes\_role | The role applied to these users |
| namespace | Kubernetes namespace |
| user\_kubeconfigs | User Kubeconfig yaml files |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## The Giants underneath this module
- pre-commit.com/
- terraform.io/
- github.com/tfutils/tfenv
- github.com/segmentio/terraform-docs
