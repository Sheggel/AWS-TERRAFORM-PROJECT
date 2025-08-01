
# VPC Configuration with EC2 Instances, Application Load Balancer, and S3 Access

This project involves setting up a Virtual Private Cloud (VPC) infrastructure on Amazon Web Services (AWS) to host a scalable and secure application environment. The architecture is designed to ensure high availability, internet connectivity, and controlled access to AWS resources.

<b>VPC Configuration:</b> A VPC is created to provide an isolated network environment for the application. Within this VPC, two public subnets are provisioned, each deployed in a separate Availability Zone (AZ) to enhance fault tolerance and high availability.

<b>Internet Connectivity:</b> An Internet Gateway is attached to the VPC to enable communication between resources in the public subnets and the internet. Route tables are configured to associate the Internet Gateway with the public subnets, ensuring that traffic from these subnets can reach external networks.

<b>EC2 Instances:</b> Two Amazon Elastic Compute Cloud (EC2) instances are launched, one in each public subnet, to host the application. Deploying the instances in different Availability Zones ensures resilience against potential AZ-specific failures.

<b>IAM Role for S3 Access:</b> An AWS Identity and Access Management (IAM) role is created and attached to both EC2 instances. This role is configured with the necessary permissions to allow secure access to a designated Amazon Simple Storage Service (S3) bucket, enabling the application to read from or write to the bucket as needed.

<b>Application Load Balancer (ALB):</b> An Application Load Balancer is deployed to distribute incoming application traffic across the two EC2 instances. The ALB is configured with a target group that includes both EC2 instances, ensuring load balancing and high availability. The ALB listens for incoming requests and routes them to the healthy instances in the target group.

This architecture provides a robust, scalable, and secure environment for hosting applications, leveraging AWS services to ensure high availability, efficient traffic distribution, and controlled access to S3 resources.

## Prerequisite

- AWS Account
- IAM User with access to the resources we want to create
- Set up security credentials
- Install Terraform
- Install AWS CLI

#### Configure aws cli

```bash
  aws configure
```
## Project Structure
```bash
  .
├── main.tf
├── variables.tf
├── terraform.tfvars
├── backend.tf
├── modules/
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── alb/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── iam/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── s3/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
```
## Deployment Steps

#### Initialize Terraform:
```bash
  terraform init
```
#### Validate Configuration:
```bash
  terraform validate
```
#### Plan the Deployment:
```bash
  terraform plan
```
#### Apply the Configuration:
```bash
  terraform apply 
```
