resource "kubernetes_manifest" "db-storage-class" {
  manifest = yamldecode(file("./config/db-storage-class.yaml"))
}