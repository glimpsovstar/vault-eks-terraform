module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.28"

  subnet_ids = data.terraform_remote_state.aws_dev_vpc.outputs.subnet_ids
  vpc_id     = data.terraform_remote_state.aws_dev_vpc.outputs.vpc_id

  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 2
      instance_types   = [var.instance_type]
    }
  }
}

