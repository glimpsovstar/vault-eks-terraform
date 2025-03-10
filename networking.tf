resource "kubernetes_service" "vault_service" {
  metadata {
    name      = "vault-service"
    namespace = "vault"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }

  spec {
    selector = {
      app = "vault"
    }

    port {
      name        = "https"
      port        = 8200
      target_port = 8200
    }

    type = "LoadBalancer"
  }
}

