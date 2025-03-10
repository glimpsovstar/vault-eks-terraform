output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "vault_service_url" {
  value = "https://${var.vault_dns_name}"
}

