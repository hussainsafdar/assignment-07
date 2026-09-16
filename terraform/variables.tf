variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "assignment07"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "my-devops-key"
}

variable "ami_id" {
  default = "ami-05a3e9423ae4d7a19"
}

variable "s3_bucket_name" {}
