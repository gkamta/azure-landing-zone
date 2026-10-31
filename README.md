# Azure Landing Zone Terraform Configuration

This Terraform configuration sets up the backend infrastructure for managing Azure Landing Zone deployments using Terraform state stored in Azure Storage.

## Prerequisites

- Azure CLI (`az`) installed and authenticated
- Terraform >= 1.0
- Azure subscription

## Files Structure

- `main.tf` - Main configuration with provider and resources
- `variables.tf` - Input variable definitions
- `outputs.tf` - Output values
- `locals.tf` - Local values and common tags
- `terraform.tfvars` - Variable values (update with your values)
- `.gitignore` - Git ignore rules for Terraform

## Setup Instructions

### 1. Update Variables

Edit `terraform.tfvars` and replace:
```hcl
subscription_id = "YOUR-ACTUAL-SUBSCRIPTION-ID"
```

### 2. Initialize Terraform

```bash
cd azure-landing-zone/terraform
terraform init
```

### 3. Validate Configuration

```bash
terraform validate
terraform fmt
```

### 4. Plan Deployment

```bash
terraform plan -out=tfplan
```

### 5. Apply Configuration

```bash
terraform apply tfplan
```

## Backend Configuration

This configuration uses Azure Storage as the Terraform backend:
- **Resource Group**: `rg-tfstate-alz-lab`
- **Storage Account**: `sttfstatealzlab001`
- **Container**: `tfstate`
- **State File**: `terraform.tfstate`

### Security Features

- HTTPS only traffic
- TLS 1.2 minimum
- Shared access key disabled (use RBAC instead)
- Private container access

## Outputs

After applying, you'll get:
- Resource Group ID and Name
- Storage Account details
- Backend configuration example

## Troubleshooting

### Storage Account Name Already Exists

If the storage account name is taken, update `terraform.tfvars`:
```hcl
storage_account_name = "sttfstate<your-unique-suffix>001"
```

### Subscription Not Found

Verify your subscription ID:
```bash
az account list --output table
```

## Tags

All resources are tagged with:
- `Environment`: lab/dev/staging/prod
- `ManagedBy`: Terraform
- `Project`: AzureLandingZone
- `CreatedAt`: Timestamp
- Custom tags from `terraform.tfvars`

## Next Steps

Once the backend is set up, you can use this configuration to store state for other Azure Landing Zone resources.
