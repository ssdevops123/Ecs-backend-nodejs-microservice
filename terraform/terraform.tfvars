app_name           = "Nodejs-backend"
environment        = "qa"
vpc_id             = "vpc"  # This is DEV VPC
public_subnet_ids  = ["subnet-x1", "subnet-x2"] # DEV Public Subnets
private_subnet_ids = ["subnet-y1", "subnet-y2"] # DEV Private Subnets
github_repo        = "sowjanya/sampleproject"
github_branch      = "main"



recupe_dev_app_sg = ["sg-Z1"]

github_connection_arn = "arn:aws:codestar-connections:us-west-2:136279434049:connection/bce23acd-20cf-4659-a6a1-60fe63d3dea3"
acm_certificate_arn = "arn:aws:acm:us-west-2:136279434049:certificate/xxxx"

enable_ssl = true
ecs_env_file_s3_path = "s3://s3-bucketname/api-sandbox/env-variables/newdb.env"

ecs_cpu    = 256  //deafult value= 256
ecs_memory = 512  //default value= 512


