terraform {
  required_version = ">=1.0.0, < 2.0"


  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.12.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.6.0"
    }
  }
}


provider "kubernetes" {
  config_context_cluster = "hyperops"
  config_path            = "~/.kube/config"
}



