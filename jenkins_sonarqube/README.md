
# Jenkins + SonarQube CI/CD Pipeline for Deploying WAR in Tomcat

This project demonstrates how to use **Jenkins**, **SonarQube**, **Terraform**, and **Tomcat** to automate the deployment of a WAR file.

## Prerequisites

- **Jenkins** installed: [Install Jenkins](https://www.jenkins.io/doc/book/installing/)
- **SonarQube** installed: [Install SonarQube](https://docs.sonarqube.org/latest/setup/install-server/)
- **Terraform** installed: [Install Terraform](https://www.terraform.io/downloads.html)
- **Tomcat** server running.
- A **GitHub repository** containing your Java project with a WAR file.

## File Structure

```
/modules
  /jenkins
  /sonarqube
  /tomcat
main.tf
variables.tf
Jenkinsfile
```

### File Descriptions:
- `main.tf`: Contains Terraform configurations to deploy resources (e.g., Jenkins, SonarQube, Tomcat).
- `variables.tf`: Contains the variables used in the Terraform configuration (e.g., project name, region, instance type).
- `Jenkinsfile`: Defines the Jenkins pipeline steps for building, testing, and deploying the WAR file to Tomcat.

## Steps to Deploy

### 1. **Set up Jenkins and SonarQube using Terraform**
- Use Terraform modules to create Jenkins, SonarQube, and Tomcat instances.
- The `main.tf` file will call Terraform modules to set up these resources.

### 2. **Jenkins Pipeline Configuration (Jenkinsfile)**
The `Jenkinsfile` defines the pipeline with the following steps:
- **Build**: Pull the source code and create the WAR file.
- **SonarQube Analysis**: Run SonarQube for static code analysis.
- **Deploy to Tomcat**: Deploy the generated WAR file to the Tomcat server.

### 3. **Terraform Configuration**
- Use Terraform to deploy the necessary infrastructure (e.g., Jenkins server, SonarQube server, Tomcat instance) on your cloud provider.
- Configure the environment and integrate it with Jenkins for continuous delivery.

### 4. **Run the Pipeline**
- Trigger the Jenkins pipeline, which will:
  - Build the project.
  - Analyze the code with SonarQube.
  - Deploy the WAR file to the Tomcat server.

---

## Terraform Commands

- **Initialize Terraform**:
  ```bash
  terraform init
  ```

- **Apply Terraform Configuration**:
  ```bash
  terraform apply
  ```

- **Destroy Resources**:
  ```bash
  terraform destroy
  ```

