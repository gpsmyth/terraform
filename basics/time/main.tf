locals {
  time = timestamp()
}

output "timestamp" {
  value = local.time
  # value = timestamp()
}
