variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "vault-cluster"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "vault_dns_name" {
  description = "Vault public domain name"
  type        = string
  default     = "vault-poc.withdevo.dev"
}

variable "tls_email" {
  description = "Email address for Let's Encrypt SSL certificate registration"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EKS worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "storage_size" {
  description = "Storage size for Vault Raft backend"
  type        = string
  default     = "10Gi"
}

