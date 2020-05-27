# terraform-kubernetes-namespace-admins [![](https://github.com/rhythmictech/terraform-kubernetes-namespace-admins/workflows/pre-commit-check/badge.svg)](https://github.com/rhythmictech/terraform-kubernetes-namespace-admins/actions) <a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=RhythmicTech" alt="follow on Twitter"></a>
Create kubeconfig files that give the user access over a namespace

## Example
Here's what using the module will look like
```
module "example" {
  source = "rhythmictech/terraform-kubernetes-namespace-admins
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
| client\_ca\_certificate | PEM-encoded root certificates bundle for TLS authentication. | `string` | n/a | yes |
| client\_certificate | PEM-encoded client certificate for TLS authentication. | `string` | n/a | yes |
| client\_key | PEM-encoded client certificate key for TLS authentication. | `string` | n/a | yes |
| host | The hostname (in form of URI) of Kubernetes master. | `string` | n/a | yes |
| name | Moniker to apply to all resources in the module | `string` | n/a | yes |
| namespace | Kubernetes namespace to populate | `string` | n/a | yes |
| namespace\_admins | Names of the Users who will have access kubernetes cluster/namespace | `list(string)` | `[]` | no |
| namespace\_admins\_rule | APIGroups, resources, and verbs that define the namespace admin access | <pre>object({<br>    api_groups = list(string)<br>    resources  = list(string)<br>    verbs      = list(string)<br>  })</pre> | <pre>{<br>  "api_groups": [<br>    ""<br>  ],<br>  "resources": [<br>    "*"<br>  ],<br>  "verbs": [<br>    "*"<br>  ]<br>}</pre> | no |
| tags | User-Defined tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| tags\_module | Tags Module in it's entirety |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## The Giants underneath this module
- pre-commit.com/
- terraform.io/
- github.com/tfutils/tfenv
- github.com/segmentio/terraform-docs
