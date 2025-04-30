variable "project" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment (dev/stage/prod)"
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "node_group_role_arn" {
  description = "The IAM role ARN to associate with the node group"
  type        = string
}

variable "instance_types" {
  description = "List of EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_capacity" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes in the node group"
  type        = number
  default     = 3
}

variable "ssh_key_name" {
  description = "The SSH key name for the EC2 instances"
  type        = string
}
variable "eks_dependency" {
  description = "IAM role dependency to ensure ordering"
}
