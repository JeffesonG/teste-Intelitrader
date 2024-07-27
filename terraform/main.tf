module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-intelitrader"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnets[0]
  key_name      = var.key_name

  security_groups = [
    "${aws_security_group.this.id}",
  ]

  tags = {
    Name = "WebServer"
  }
  volume_tags = {
    Name = "WebServer"
  }
}