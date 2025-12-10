app_name           = "testing-nous111"
environment        = "qa"
vpc_id             = "vpc-0f3391e84c4f0ce79"  # This is DEV VPC
public_subnet_ids  = ["subnet-020772b505a06f11e", "subnet-0ad2a482ea544e2eb"] # DEV Public Subnets
private_subnet_ids = ["subnet-09a5205170294f953", "subnet-06e7f91ac149c8fc9"] # DEV Private Subnets
//github_repo        = "sowjanyanous/sampleproject"
//github_branch      = "main"
github_repo        = "Plethy/api-sandbox"
github_branch      = "PRM-19168"

// recupe_dev_app_sg = ["sg-0c3d3c3032a0ff1e2"]# Copy Recupe Dev Application security groups to attach to ECS tasks
recupe_dev_app_sg = ["sg-0919982972de5b550"]

github_connection_arn = "arn:aws:codestar-connections:us-west-2:136279434049:connection/bce23acd-20cf-4659-a6a1-60fe63d3dea3"
acm_certificate_arn = "arn:aws:acm:us-west-2:136279434049:certificate/e04e691d-3ce5-477f-b0b3-9b40d0497fb8"

enable_ssl = true
ecs_env_file_s3_path = "s3://recupe-devops-qa/api-sandbox/env-variables/newdb.env"

ecs_cpu    = 256  //deafult value= 256
ecs_memory = 512  //default value= 512
