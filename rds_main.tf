module "itss-ojt-rds" {
    source = "./rds"
    prefix = var.prefix
    username = var.username
    password = var.password
    rds_sg_id = module.itss-ojt-security.rds_sg_id
    private_subnet_ids = var.private_subnet_ids
}