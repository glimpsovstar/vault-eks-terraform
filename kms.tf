resource "aws_kms_key" "vault_kms" {
  description             = "KMS Key for Vault Auto-Unseal"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

