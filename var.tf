variable "vpc_cidr" {
    type = string
    description = "VPC CIDR block in the private IP address space"  
    default = "10.0.0.0/20"
}

variable "public_subnet_cidr" { 
    type = string
    description = "Public subnet CIDR block"
    default = "10.0.0.0/21"    
}

variable "private_subnet_cidr" {
    type = string
    description = "Private subnet CIDR block"   
    default = "10.0.8.0/21"
}

variable "region" {
    type = string
    description = "AWS region"   
    default = "us-east-2" 
}

variable "all_traffic" {
    type = string
    description = "Allow all traffic"  
    default = "0.0.0.0/0"  
}
