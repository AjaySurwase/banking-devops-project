output "eks_cluster_id" {
  value = aws_eks_cluster.this.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "eks_cluster_version" {
  value = aws_eks_cluster.this.version
}

output "eks_cluster_name" {
  value = aws_eks_cluster.this.name
}

output "eks_cluster_ca_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}
