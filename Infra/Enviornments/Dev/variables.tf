variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}
variable "project" {
  description = "Project name prefix"
  type        = string
}

variable "env" {
  description = "Environment name (dev/stage/prod)"
  type        = string
}
#eks variables

variable "k8s_version" {
  type = string
}
variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}
#Node variables

variable "instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "ssh_key_name" {
  description = "SSH key name for EC2 instances"
  type        = string
}
#EC2
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
#s3
variable "s3_bucket_name" {
  description = "This is name of bucket"
  type        = string
}
variable "local_table_name" {
  description = "local table name"
  type        = string
}

