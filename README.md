# Terraform Vault on AWS EKS

This repository contains Terraform code to deploy **HashiCorp Vault** on **AWS EKS** using **Terraform Cloud**.

## Features
- 🚀 **EKS Cluster** deployment
- 🔒 **Vault with Raft Storage & AWS KMS Auto-Unseal**
- 🌐 **Let's Encrypt TLS with cert-manager**
- 🔗 **AWS Load Balancer (NLB) for Vault**
- ☁️ **Terraform Cloud Integration**

## Deployment Steps

### 1️⃣ Prerequisites
- **Terraform CLI**, **AWS CLI**, and **kubectl**
- **Terraform Cloud** workspace (`vault-eks-workspace`)
- **Networking workspace** (`tf-aws-network-dev`) with:
  - **VPC ID**
  - **Subnet IDs**

### 2️⃣ Clone the Repository
```sh
git clone https://github.com/glimpsovstar/vault-eks-terraform.git
cd vault-eks-terraform
```

### 3️⃣ Deploy with Terraform Cloud
```sh
terraform init
terraform apply -auto-approve
```

## Accessing Vault
- **Get LoadBalancer URL**:  
  ```sh
  kubectl get svc -n vault vault-service
  ```
- **Visit Vault UI**:  
  ```
  https://vault-poc.withdevo.dev
  ```

## Destroying Resources
```sh
terraform destroy -auto-approve
```

## Configuration Variables
| Variable        | Default Value         | Description |
|----------------|----------------------|-------------|
| `aws_region`   | `ap-southeast-2`           | AWS Region |
| `cluster_name` | `vault-cluster`       | EKS Cluster Name |
| `instance_type` | `t3.medium`          | EKS Node Type |
| `storage_size` | `10Gi`                | Vault Storage Size |

## License
This project is licensed under the **MIT License**.

---

Happy Terraforming! 🚀
