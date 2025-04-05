resource "aws_vpc" "vpc01" {
  cidr_block = var.vpc_cidr 

  tags = {
    Name = random_pet.pet_name.id
  }
}