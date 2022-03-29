module "mysql_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/mysql"
  version = "4.3.0"

  name        = "${var.environment}-mysql-sg"
  description = "Security group with MySQL/Aurora using port 3306"
  vpc_id      = module.vpc.vpc_id

  auto_ingress_with_self = []
  ingress_cidr_blocks    = [module.vpc.vpc_cidr_block]
}


module "alb_security_group" {

  source  = "terraform-aws-modules/security-group/aws//modules/https-443"
  version = "4.3.0"

  name        = "${var.environment}-alb-sg"
  description = "Security group for ALB public access using port 443"
  vpc_id      = module.vpc.vpc_id

  auto_ingress_with_self = []

  ingress_with_cidr_blocks = ["0.0.0.0/0"]

}
