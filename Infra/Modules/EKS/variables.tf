variable "project" {
  type        = string
  description = "Project name prefix"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "k8s_version" {
  type    = string
  default = "1.27"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "cluster_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS cluster"
}

variable "iam_dependency" {
  description = "IAM role dependency to ensure ordering"
}
