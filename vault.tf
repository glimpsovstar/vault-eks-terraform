resource "kubernetes_stateful_set" "vault" {
  metadata {
    name      = "vault"
    namespace = "vault"
  }

  spec {
    service_name = "vault"
    replicas     = 2

    selector {
      match_labels = {
        app = "vault"
      }
    }

    template {
      metadata {
        labels = {
          app = "vault"
        }
      }

      spec {
        service_account_name = "vault"

        container {
          name  = "vault"
          image = "hashicorp/vault:1.14"

          port {
            container_port = 8200
          }

          env {
            name  = "VAULT_ADDR"
            value = "https://${var.vault_dns_name}"
          }

          env {
            name  = "VAULT_STORAGE_BACKEND"
            value = "raft"
          }

          env {
            name  = "VAULT_RAFT_NODE_ID"
            value = "vault-0"
          }

          env {
            name  = "VAULT_UNSEAL_KMS_KEY_ID"
            value = aws_kms_key.vault_kms.key_id
          }

          volume_mount {
            name       = "vault-storage"
            mount_path = "/vault/data"
          }
        }
      }
    }

    volume_claim_template {
      metadata {
        name = "vault-storage"
      }

      spec {
        access_modes = ["ReadWriteOnce"]

        resources {
          requests = {
            storage = "10Gi"
          }
        }
      }
    }
  }
}

