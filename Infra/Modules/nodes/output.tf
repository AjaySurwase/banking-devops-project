output "node_group_name" {
  value = aws_eks_node_group.default.node_group_name
}

output "node_group_status" {
  value = aws_eks_node_group.default.status
}

output "node_group_instance_types" {
  value = aws_eks_node_group.default.instance_types
}
