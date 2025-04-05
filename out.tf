output "random_name" {
    value = random_pet.pet_name.id
}

output "public_ip" {
    value = aws_eip.windows_eip.public_ip
}

output "private_ip" {
    value = aws_instance.my_windows_server.private_ip
}

output "windows_ami_id" {
  value = data.aws_ami.windows.id
}

output "decrypted_pwd"{
  value = rsadecrypt(aws_instance.my_windows_server.password_data, file("./${random_pet.pet_name.id}-key"))
}