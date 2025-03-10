resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "vault"

  set {
    name  = "installCRDs"
    value = "true"
  }
}

