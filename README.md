## Homework

● Make sure you have account on Github 
- Make sure you have account on DockerHub (Personal subscription)
- Create GCP account 
- Create GCP Project

- All resources will be created within this project

● For acceptance:
- Use Terraform to create 
  - 1 GCS bucket, 
  - 1 Bigquery dataset, 
  - 1 VM in your GCP project. 
- Terraform state should be stored in remote GCS bucket. 
- You should provide link to your Github public repo with Terraform code + terraform 
- init/plan/apply/destroy logs.

----
## Project structure

Homework contains two implementations of the remote Terraform state setup.

### 1. Existing backend bucket

Directory: `existing_backend_bucket/`

A separate GCS bucket for the Terraform backend is created before Terraform initialization.

Terraform is initialized with the GCS backend, so the state is stored remotely from the beginning.

Flow:

`backend bucket → terraform init → plan → apply → destroy`

During the first `terraform apply`, VM creation failed because the Compute Engine API was disabled. After enabling the API, the second apply successfully created the remaining resource.

### 2. State migration

Directory: `migrate_state_backend/`

Terraform is initially initialized without a remote backend, so the state is stored locally.

After the infrastructure is created, a separate GCS backend bucket is created and the existing Terraform state is migrated to it using:

`terraform init -migrate-state`

Flow:

`local state → plan → apply → create backend bucket → migrate state to GCS → destroy`


## Authentication

Terraform authentication uses Google Cloud Application Default Credentials (ADC) with Service Account Impersonation

## Logs

Terraform execution logs are stored in the `logs/` directory of each implementation.
