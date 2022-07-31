resource "kubernetes_labels" "hyperops-m02" {
  api_version = "v1"
  kind        = "Node"
  metadata {
    name = "hyperops-m02"
  }
  labels = {
    "role" = "db"
  }
}


resource "kubernetes_labels" "hyperops" {
  api_version = "v1"
  kind        = "Node"
  metadata {
    name = "hyperops"
  }
  labels = {
    "role" = "app"
  }
}