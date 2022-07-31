resource "kubernetes_manifest" "ingress" {
  manifest = yamldecode(file("./config/ingress.yaml"))
  depends_on = [
    kubernetes_manifest.app-namespace
  ]
}