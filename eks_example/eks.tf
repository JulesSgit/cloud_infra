# Create after iam role and permissions have been created
/* module "eks" {
  source = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster-name
  cluster_version = var.cluster-version
  subnets         = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      instance_type                 = var.instance-type
      asg_max_size = var.asg-max-size
      asg_desired_capacity          = var.asg-desired-capacity
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
  ]
}
 */