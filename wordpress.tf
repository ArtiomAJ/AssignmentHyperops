resource "kubernetes_manifest" "secret-wp" {
  depends_on = [
    kubernetes_manifest.app-namespace,
    kubernetes_labels.hyperops
  ]
  manifest = yamldecode(file("./wordpress/secret.yaml"))
}



resource "kubernetes_manifest" "worpress-d" {
  depends_on = [
    kubernetes_labels.hyperops,
    kubernetes_manifest.app-namespace,
    kubernetes_manifest.secret-wp
  ]
  manifest = yamldecode(file("./wordpress/worpress-d.yaml"))
}


resource "kubernetes_manifest" "worpress-s" {
  depends_on = [
    kubernetes_labels.hyperops,
    kubernetes_manifest.app-namespace
  ]
  manifest = yamldecode(file("./wordpress/worpress-s.yaml"))
}


resource "kubernetes_manifest" "wp-config" {
  depends_on = [
    kubernetes_labels.hyperops,
    kubernetes_manifest.app-namespace
  ]
  manifest = yamldecode(file("./wordpress/configmap.yaml"))
}