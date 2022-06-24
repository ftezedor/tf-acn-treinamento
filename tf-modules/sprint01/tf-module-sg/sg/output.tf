output "security_groups_id" {
  description = "Security Groups"
  value       = aws_security_group.sg.id
}

output "security_groups_name" {
  description = "Security Groups"
  value       = aws_security_group.sg.name
}