Here’s the simplified README without the code examples:

---

# GCP Jumpbox Windows Setup with Terraform

This guide provides instructions for deploying a **Windows Jumpbox** VM, Bastion Host, firewall, service accounts, subnets, VM, and VPC on Google Cloud Platform (GCP) using Terraform.

## Prerequisites
Before you begin, make sure you have:
- **Terraform** installed: [Install Terraform](https://www.terraform.io/downloads.html)
- **Google Cloud SDK (gcloud)** installed: [Install Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- A **Google Cloud Project** with the required IAM roles and a **service account key**.

## File Structure

The project files are organized as follows:

```
/modules
  /bastion_host
  /firewall
  /service_account
  /subnets
  /vm
  /vpc
main.tf
variables.tf
```

## Steps to Deploy

### 1. **Configure the Google Cloud Provider**
In the `main.tf` file, configure the Google Cloud provider and authenticate using a service account key.

### 2. **Create the VPC (Virtual Private Cloud)**
Define a VPC to organize network resources.

### 3. **Create Subnets**
Set up subnets within the VPC to host your resources.

### 4. **Create a Firewall Rule**
Set up a firewall rule to allow RDP or SSH access to the Jumpbox VM.

### 5. **Deploy the Windows Jumpbox VM**
Use Terraform to deploy the Windows-based Jumpbox VM with appropriate settings.

### 6. **Set Up a Bastion Host**
configure a Bastion Host to securely access the Jumpbox VM.

---

## Terraform Commands

- **Initialize Terraform**: 
  Run `terraform init` to initialize the project.

- **Apply the Configuration**: 
  Run `terraform apply` to create the resources defined in the Terraform configuration.

- **Destroy Resources**: 
  Run `terraform destroy` to delete the resources.

