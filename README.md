# Assignment 07 - Ansible Roles Review & Terraform Code Management

## Overview
This project provisions AWS infrastructure (VPC, EC2, S3) using Terraform, manages it via GitHub Actions CI/CD, and configures the EC2 instance using separate Ansible roles for Docker, Nginx, Docker Compose, and an Nginx port change (80 to 81).

## Architecture
- VPC with a public subnet, Internet Gateway, and Route Table
- Security Group allowing SSH (22), HTTP (80), and custom Nginx port (81)
- EC2 instance (Ubuntu 22.04, t3.micro) inside the public subnet
- S3 bucket for general storage
- Remote state stored in a separate S3 bucket (assignment07-tfstate-hassan)

## Project Structure
assignment-07/
  terraform/
    provider.tf
    variables.tf
    vpc.tf
    security_group.tf
    ec2.tf
    s3.tf
    outputs.tf
    terraform.tfvars
  ansible/
    ansible.cfg
    inventory.ini
    playbook.yml
    roles/
      docker/
      nginx/
      docker_compose/
      nginx_port_change/
  .github/workflows/
    provision.yml
    destroy.yml

## Terraform
Run these commands inside the terraform folder: terraform init, terraform plan, terraform apply

Remote state is stored in an S3 bucket (assignment07-tfstate-hassan) so both local runs and GitHub Actions share the same state.

Outputs: ec2_public_ip, s3_bucket_name

## GitHub Actions CI-CD
provision.yml triggers on push to terraform/** or manually via workflow_dispatch, and runs terraform init, plan, apply -auto-approve.

destroy.yml is manual trigger only (workflow_dispatch), and runs terraform destroy -auto-approve.

Required GitHub Secrets:
AWS_ACCESS_KEY_ID - AWS IAM access key
AWS_SECRET_ACCESS_KEY - AWS IAM secret key
TF_VAR_s3_bucket_name - Name for the S3 bucket created by Terraform

## Ansible Roles
docker - Installs Docker Engine from the official Docker repository
nginx - Installs Nginx from Ubuntu default repository
docker_compose - Downloads and installs the Docker Compose binary
nginx_port_change - Changes Nginx listening port from 80 to 81

Run these commands inside the ansible folder: ansible web -m ping, then ansible-playbook playbook.yml

Verify with: curl http://EC2_PUBLIC_IP:81

## Completion Checklist
- Ansible roles reviewed via KodeKloud course
- Terraform code written for VPC, EC2, and S3
- Code follows Terraform best practices
- Terraform code pushed to GitHub
- GitHub Actions workflow for provisioning
- GitHub Actions workflow for destroying infrastructure
- Separate Ansible roles for Docker, Nginx, and Docker Compose
- Separate Ansible role for changing Nginx port to 81

## Repo
https://github.com/hussainsafdar/assignment-07
