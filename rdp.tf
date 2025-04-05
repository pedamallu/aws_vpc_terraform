resource "local_file" "rdp_file" {
  content = templatefile("./rdp.tpl", {
    public_ip = aws_eip.windows_eip.public_ip
  })
  filename = "./${random_pet.pet_name.id}-windows.rdp"
}

resource "null_resource" "rdp_exec" {
  triggers = {
    # rdp_file = local_file.rdp_file.filename
    windows_dns = aws_instance.my_windows_server.public_dns
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "open ${random_pet.pet_name.id}-windows1.rdp"
  }
  
  depends_on = [ local_file.rdp_file1]
}

resource "local_file" "rdp_file1" {
  filename = "${random_pet.pet_name.id}-windows1.rdp"
  content  = <<-RDP_CONTENT
    auto connect:i:1
    full address:s:${aws_eip.windows_eip.public_ip}
    username:s:Administrator
    audiomode:i:2
    audiocapturemode:i:1
  RDP_CONTENT
  depends_on = [ aws_instance.my_windows_server, aws_eip.windows_eip ]
}