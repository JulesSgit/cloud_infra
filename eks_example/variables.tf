variable "cluster-name" {
  default     = "eks-cluster"
  type        = string
  description = "The name of your EKS Cluster"
}

variable "aws-region" {
  default     = "us-east-1"
  type        = string
  description = "The AWS Region to deploy EKS"
}

variable "availability-zones" {
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type        = list
  description = "The AWS AZ to deploy EKS"
}

variable "private-subnet-cidr" {
  default     = ["10.0.1.0/24", "10.0.32.0/24", "10.0.64.0/24"]
  type        = list
  description = "Private Subnet CIDR"
}

variable "public-subnet-cidr" {
  default     = ["10.0.101.0/24", "10.0.128.0/24", "10.0.144.0/24"]
  type        = list
  description = "Public Subnet CIDR"
}