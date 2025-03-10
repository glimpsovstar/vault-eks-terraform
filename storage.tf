resource "kubernetes_persistent_volume_claim" "vault_storage" {
  metadata {
    name      = "vault-pvc"
    namespace = "vault"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.storage_size
      }
    }
  }
}

