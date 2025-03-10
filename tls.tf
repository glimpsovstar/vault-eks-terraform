resource "kubernetes_manifest" "letsencrypt_issuer" {
  depends_on = [module.eks] # To ensure EKS is ready before cert-manager is applied

  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-prod"
    }
    spec = {
      acme = {
        email      = var.tls_email
        server     = "https://acme-v02.api.letsencrypt.org/directory"
        privateKeySecretRef = {
          name = "letsencrypt-prod"
        }
        solvers = [{
          http01 = {
            ingress = {
              class = "nginx"
            }
          }
        }]
      }
    }
  }
}

resource "kubernetes_manifest" "vault_certificate" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Certificate"
    metadata = {
      name      = "vault-tls"
      namespace = "vault"
    }
    spec = {
      secretName = "vault-tls"
      issuerRef = {
        name = "letsencrypt-prod"
        kind = "ClusterIssuer"
      }
      dnsNames = [var.vault_dns_name]
    }
  }
}

