# EC2 Instance
resource "aws_instance" "jenkins" {
  ami                    = var.ami_id        # Use the correct AMI ID for the instance
  instance_type          = var.instance_type # e.g. t2.medium
  key_name               = var.key_name      # SSH key pair for access
  subnet_id              = var.subnet_id     # Reference to the subnet from VPC module
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]



  tags = {
    Name = "Jenkins Instance"
  }
}

# Security Group for EC2 (allow SSH)
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow SSH access to EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins Security Group"
  }
}
