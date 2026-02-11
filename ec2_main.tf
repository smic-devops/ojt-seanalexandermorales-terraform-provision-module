module "itss-ojt-ec2" {
    source = "./ec2"
    prefix = var.prefix
    vpc_id = var.vpc_id
    subnet_id = var.private_subnet_ids[0]
    ec2_sg_id = module.itss-ojt-security.ec2_sg_id
    tg_arn = module.itss-ojt-alb.tg_arn
    ami_id = var.ami_id
    instance_type = var.instance_type
}