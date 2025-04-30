variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "The SSH key name to access the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the EC2 instance will be launched"
  type        = string
}
