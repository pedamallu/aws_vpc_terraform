data "aws_ami" "windows" {
    most_recent = true
    owners      = ["amazon"]

    filter {
        name   = "name"
        values = ["Windows_Server-2025-English-Full-Base-*"]
    }
}