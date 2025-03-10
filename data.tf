data "terraform_remote_state" "aws_dev_vpc" {
  backend = "remote"

  config = {
    organization = "djoo-hashicorp"

    workspaces = {
      name = "tf-aws-network-dev"
    }
  }
}

data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_name

  depends_on = [module.eks]
}

data "aws_eks_cluster_auth" "eks_auth" {
  name = module.eks.cluster_name
}
