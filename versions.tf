terraform {
  required_version = ">= 0.12.0"

  required_providers {
    kubernetes = "~> 1.11.0"
    local      = "~> 1.4"
    tls        = "~> 2.1"
  }
}
