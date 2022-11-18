output "instanceid" {
   value = aws_instance.web-server-instance.arn
 }


output "instancetype" {
   value = aws_instance.web-server-instance.instance_type
 }

output "instance_state" {
value = aws_instance.web-server-instance.instance_state
}