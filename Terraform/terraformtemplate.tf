provider "aws" {
  region = "us-west-1"  # Replace with your desired AWS region
}

resource "aws_instance" "ec2_instance" {
  count         = 4
  ami           = ami-0be7a0f9ecc26144d  # Replace with the Red Hat Linux 8 AMI ID
  instance_type = "t2.medium"               # Replace with your desired instance type

  tags = {
    Name = "CYB451TEST ${count.index + 1}"
  }
}

resource "aws_db_instance" "rds_database" {
  identifier            = "my-rds-database"
  engine                = "mysql"           # Replace with your desired database engine
  instance_class        = "db.t2.micro"     # Replace with your desired instance type
  allocated_storage     = 20                # Replace with your desired storage size in GB
  username              = "admin"           # Replace with your desired database username
  password              = "password123"     # Replace with your desired database password
  publicly_accessible  = false

  tags = {
    Name = "RDS Database"
  }
}

resource "aws_iam_user" "iam_user" {
  count = 3
  name  = "user${count.index + 1}"

  tags = {
    Name = "IAM User ${count.index + 1}"
  }
}

output "ec2_instance_ids" {
  value = aws_instance.ec2_instance[*].id
}

output "rds_database_endpoint" {
  value = aws_db_instance.rds_database.endpoint
}
