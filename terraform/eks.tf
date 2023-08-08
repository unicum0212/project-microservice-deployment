module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = "microservice-eks-cluster"
  cluster_version = "1.27"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.microservice-vpc.vpc_id
  subnet_ids = module.microservice-vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    general = {
      desired_size = 2
      min_size     = 2
      max_size     = 3

      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }
  }
}
