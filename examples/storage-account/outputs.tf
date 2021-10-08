output "sa_names" {
  value = toset([
    for sa in module.storage-accounts : sa.name
  ])
}