Here's your updated README file content in Markdown format:

```markdown
# Installation Script: Docker, Minikube, and kubectl on Ubuntu

This guide provides a comprehensive script to automate the installation of Docker, Minikube, and kubectl on an Ubuntu-based system. This setup is ideal for preparing your machine for local Kubernetes cluster development and testing.

---

## Steps

### 1. Remove Existing Docker Packages

This step ensures that any conflicting or outdated Docker packages are removed before installing the latest version.

```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

---

### 2. Update the System and Install Required Dependencies

Update the system packages and install essential utilities.

```bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl wget apt-transport-https -y
```

---

### 3. Install Docker

#### a. Install Required Certificates

```bash
sudo apt-get install ca-certificates curl
```

#### b. Create Directory for Docker's GPG Key

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

#### c. Download and Install Docker’s GPG Key

```bash
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

#### d. Add Docker Repository

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

#### e. Install Docker

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

#### f. Verify Docker Installation

```bash
sudo docker --version
```

---

### 4. Install Minikube

#### a. Download and Install Minikube

```bash
sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
```

#### b. Verify Minikube Installation

```bash
sudo minikube version
```

---

### 5. Install kubectl

#### a. Download kubectl

```bash
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```

#### b. Verify kubectl Integrity

```bash
sudo echo "$(cat kubectl.sha256) kubectl" | sha256sum --check
```

#### c. Install kubectl

```bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

---

### 6. Start Minikube with Docker Driver

Start Minikube using Docker as the driver.

```bash
sudo minikube start --driver=docker --force
```

---

### 7. Verify Minikube and kubectl Setup

Ensure Minikube and kubectl are correctly installed and running.

```bash
kubectl get nodes
```

---

Here are the steps to deploy NGINX on Minikube:

### 1. **Install Minikube and kubectl**
Ensure that Minikube and kubectl are installed on your system. 

### 2. **Start Minikube**
Start your Minikube cluster by running the following command:
```bash
minikube start
```

### 3. **Create a Deployment YAML File**
Create a YAML file (e.g., `nginx-deployment.yaml`) for the NGINX deployment and service. Here's an example of what the YAML file might look like:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80

---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: NodePort
```

### 4. **Apply the YAML File**
Deploy NGINX using the `kubectl apply` command:
```bash
kubectl apply -f nginx-deployment.yaml
```

### 5. **Expose the NGINX Deployment (if not already in the YAML)**
If you haven't defined the service in the YAML file, expose the NGINX deployment as a service:
```bash
kubectl expose deployment nginx-deployment --type=NodePort --port=80
```

### 6. **Access the NGINX Service**
#### Get the Minikube IP
Fetch the Minikube IP with:
```bash
minikube ip
```

#### Fetch the Service's NodePort
Get the NodePort for the NGINX service:
```bash
kubectl get svc
```
You should see something like this:
```
NAME            TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
nginx-service   NodePort   10.107.241.23   <none>        80:31234/TCP   5m
```

In this case, the NodePort is `31234`.

### 7. **Access NGINX in Your Browser**
Now you can access NGINX in your browser using:
```
http://<Minikube-IP>:<NodePort>
```
For example:
```
http://192.168.99.100:31234
```

This should display the default NGINX welcome page.

---

This process outlines how to deploy NGINX on Minikube and access it through a browser.

