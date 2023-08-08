variable "vpc_cidr_block" {}
variable "private_subnet_cidr_blocks" {}
variable "public_subnet_cidr_blocks" {}
variable "env" {}

data "aws_availability_zones" "azs" {}

module "microservice-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "microservice-vpc"
  cidr = var.vpc_cidr_block

  private_subnets = var.private_subnet_cidr_blocks
  public_subnets  = var.public_subnet_cidr_blocks
  azs             = data.aws_availability_zones.azs.names

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "environment"                                    = var.env
    "kubernetes.io/cluster/microservice-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/microservice-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                         = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/microservice-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"                = 1
  }
}
