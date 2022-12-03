output "output_vpc_a4_id" {
  description = "VPC id"
  value       = aws_vpc.vpc_a4.id
}
output "s1" {
  value = aws_subnet.SN-public-1.id
}

output "s2" {
  value = aws_subnet.SN-private-1.id
}
