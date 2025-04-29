resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.k8s_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = {
    Environment = var.env
    Project     = var.project
  }

  depends_on = [var.iam_dependency] # Ensures IAM role exists before cluster
}
