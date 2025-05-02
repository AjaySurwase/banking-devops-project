module "vpc" {
  source          = "../../modules/vpc"
  project         = var.project
  env             = var.env
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "IAM_module" {
  source  = "../../modules/iam"
  project = var.project
  env     = var.env
}

module "eks" {
  source = "../../Modules/EKS"

  project          = var.project
  env              = var.env
  cluster_name     = var.cluster_name
  k8s_version      = var.k8s_version
  subnet_ids       = module.vpc.private_subnet_ids
  cluster_role_arn = module.IAM_module.eks_cluster_role_arn

  iam_dependency = module.IAM_module # to enforce IAM dependency
}

module "node_group" {
  source = "../../Modules/nodes"

  project             = var.project
  env                 = var.env
  cluster_name        = module.eks.eks_cluster_name
  subnet_ids          = module.vpc.private_subnet_ids
  node_group_role_arn = module.IAM_module.eks_node_role_arn
  instance_types      = var.instance_types
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  ssh_key_name        = var.ssh_key_name
  eks_dependency      = module.eks
}

module "ec2" {
  source    = "../../Modules/EC2"
  ami_id    = var.ami_id
  subnet_id = module.vpc.public_subnet_ids[0]
  vpc_id    = module.vpc.vpc_id
  key_name  = var.ssh_key_name
}

module "S3" {
  source          = "../../Modules/S3"
  bucket_name     = var.s3_bucket_name
  lock_table_name = var.local_table_name
}
