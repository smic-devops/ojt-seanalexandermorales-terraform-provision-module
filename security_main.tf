module "itss-ojt-security" {
    source = "./security"
    prefix = var.prefix
    vpc_id = var.vpc_id
    ec2_sg_id = var.ec2_sg_id
}