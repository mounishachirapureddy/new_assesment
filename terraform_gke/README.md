# GCP GKE Terraform Project

This project provisions a Google Kubernetes Engine (GKE) cluster on Google Cloud Platform (GCP) using Terraform. The setup includes a modular structure for managing resources like firewalls, node pools, VPC, and more.

## Prerequisites

1. **Tools and Dependencies**:
   - Terraform installed.
   - Google Cloud SDK installed.

2. **GCP Setup**:
   - A GCP project with billing enabled.
   - Required APIs enabled (e.g., Kubernetes, Compute Engine).
   - A service account with necessary roles.



## Project Structure

```plaintext
terraform_gke/
├── modules/
│   ├── firewalls/
│   ├── k8s/
│   ├── nat/
│   ├── nodepools/
│   ├── router/
│   ├── service_account/
│   ├── subnets/
│   └── vpc/
├── main.tf
├── variables.tf
```

### Modules
- **firewalls**: Configures firewall rules.
- **k8s**: Manages Kubernetes cluster settings.
- **nat**: Sets up Network Address Translation (NAT) for private resources.
- **nodepools**: Manages GKE node pools.
- **router**: Configures a Cloud Router for routing traffic.
- **service_account**: Provisions and configures service accounts.
- **subnets**: Creates subnets within the VPC.
- **vpc**: Manages the Virtual Private Cloud network.

## Steps to Deploy

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd terraform_gke
   ```

2. **Set Up Variables**:
   - Edit `variables.tf` or create a `terraform.tfvars` file with your values:
     ```hcl
     project_id = "your-project-id"
     region     = "your-region"
     ```

3. **Initialize Terraform**:
   ```bash
   terraform init
   ```

4. **Plan the Deployment**:
   ```bash
   terraform plan
   ```

5. **Apply the Configuration**:
   ```bash
   terraform apply
   ```

6. **Access the GKE Cluster**:
   - Configure `kubectl` to access the cluster:
     ```bash
     gcloud container clusters get-credentials <cluster-name> --region <region>
     ```

## Cleanup

To remove all resources:
```bash
terraform destroy
```

