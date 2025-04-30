resource "aws_eks_node_group" "default" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project}-${var.env}-nodegroup"
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_capacity
    min_size     = var.min_size
    max_size     = var.max_size
  }

  remote_access {
    ec2_ssh_key = var.ssh_key_name
  }

  tags = {
    Name        = "${var.project}-${var.env}-nodegroup"
    Environment = var.env
  }

  depends_on = [var.eks_dependency] # Ensures IAM role exists before cluster
}
