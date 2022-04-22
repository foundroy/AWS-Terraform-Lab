output "vpc_id" {
  description = "vpd id"
  value       = aws_vpc.myvpc.id
}

output "public_sn_id" {
  description = "public subnet id"
  value       = aws_subnet.lab-public-sn.id
}

output "private_sn_id" {
  description = "private subnet id"
  value       = aws_subnet.lab-private-sn.id
}