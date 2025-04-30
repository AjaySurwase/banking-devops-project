output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.jenkins.id
}

output "ec2_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.jenkins.public_ip
}
