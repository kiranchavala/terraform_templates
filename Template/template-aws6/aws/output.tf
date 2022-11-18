output "instanceid" {
   value = aws_instance.example[*].arn
 }