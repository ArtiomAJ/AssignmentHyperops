resource "kubernetes_manifest" "secret" {
  depends_on = [
    kubernetes_labels.hyperops-m02,
    kubernetes_manifest.db-namespace
  ]
  manifest = yamldecode(file("./mariadb/secret.yaml"))
}



resource "kubernetes_manifest" "mariadb-s" {
  depends_on = [
    kubernetes_labels.hyperops-m02, 
    kubernetes_manifest.secret,
  ]
  manifest = yamldecode(file("./mariadb/mariadb-s.yaml"))
}


resource "kubernetes_manifest" "mariadb-sts" {
  depends_on = [
    kubernetes_labels.hyperops-m02,
    kubernetes_manifest.secret,
    kubernetes_manifest.mariadb-configmap,
    kubernetes_manifest.mariadb-s
  ]
  manifest = yamldecode(file("./mariadb/mariadb-sts.yaml"))
}

resource "kubernetes_manifest" "mariadb-configmap" {
  depends_on = [
    kubernetes_labels.hyperops-m02,
    kubernetes_manifest.secret
  ]
  manifest = yamldecode(file("./mariadb/configmap.yaml"))
}