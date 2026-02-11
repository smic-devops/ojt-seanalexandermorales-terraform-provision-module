module "itss-ojt-alb" {
    source = "./alb"
    prefix = var.prefix
    vpc_id = var.vpc_id
    public_subnet_ids = var.public_subnet_ids
    alb_sg_id = module.itss-ojt-security.alb_sg_id
}