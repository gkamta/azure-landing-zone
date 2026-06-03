locals {
  common_tags = merge(
    {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = "AzureLandingZone"
      CreatedAt   = timestamp()
    },
    var.tags
  )
}
