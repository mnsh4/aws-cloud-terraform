output "region" {
  value = data.aws_region.current.name
}

output "azs" {
  value = data.aws_availability_zones.available.names
}

output "rhel9_ami_ids" {
  value = aws_instance.ec2_rhel9_priv[*].id
}

output "private_keys" {
  value     = tls_private_key.youtube-rsa-4096.private_key_pem
  sensitive = true
}

output "ec2_public_ip" {
  value = aws_instance.youtube_rhel9.*.public_ip
}
