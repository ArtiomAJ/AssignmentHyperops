resource "kubernetes_manifest" "db-namespace" {
  depends_on = [
    kubernetes_labels.hyperops-m02
  ]
  manifest = yamldecode(file("./mariadb/namespace-db.yaml"))
}

resource "kubernetes_manifest" "app-namespace" {
  depends_on = [
    kubernetes_labels.hyperops
  ]
  manifest = yamldecode(file("./wordpress/namespace-app.yaml"))
}
