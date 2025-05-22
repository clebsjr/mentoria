output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "subnet_secondary_id" {
  value = module.vpc.subnet_secondary_id
}
