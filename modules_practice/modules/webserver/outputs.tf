output "instance_output" {
    value = aws_instance.webserver
    description = "Webserver created by module \"webserver\""
}