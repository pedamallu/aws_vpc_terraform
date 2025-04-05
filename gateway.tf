resource "aws_internet_gateway" "IGW" { 
    vpc_id = aws_vpc.vpc01.id

    tags = {
        Name = "${random_pet.pet_name.id}-igw"
    }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "${random_pet.pet_name.id}-nat-gw"
  }
  
}