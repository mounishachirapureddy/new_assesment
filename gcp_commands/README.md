

# GCP VM Management & File Transfer Guide

### 1. **Connect to a GCP Server (VM Instance)**
To SSH into a VM instance:
```bash
gcloud compute ssh <instance-name> --zone=<zone>
```

---

### 2. **Upload Files from Server to Local**
To copy files **from GCP VM to your local machine** using `scp`:
```bash
gcloud compute scp <instance-name>:<remote-file-path> <local-destination> --zone=<zone>
```

#### If Copying a Directory:
To copy an entire directory, you can use the `--recurse` option:
```bash
gcloud compute scp --recurse my-instance:/home/user/remote-directory ./local-directory --zone=us-central1-a
```

#### Copying Files from Local to Remote:
If you want to copy a file from your local machine to the GCE instance:
```bash
gcloud compute scp ./local-file.txt my-instance:/home/user/remote-file.txt --zone=us-central1-a
```

---

### 3. **Upload Files from Server to GCS (Google Cloud Storage Bucket)**

#### a) Upload to GCS Bucket from Server:
To upload files from your GCP VM instance to a GCS bucket:
```bash
gsutil cp <file-path> gs://<bucket-name>/
```

#### b) **Copy Directory to GCS Bucket**  
To upload a folder to the bucket (including all files):
```bash
gsutil cp -r <folder-path> gs://<bucket-name>/
```

---

### 4. **Start or Stop a GCP VM Instance**

#### a) Start a VM Instance:
To start a VM instance:
```bash
gcloud compute instances start <instance-name> --zone=<zone>
```

#### b) Stop a VM Instance:
To stop a VM instance:
```bash
gcloud compute instances stop <instance-name> --zone=<zone>
```

---

### 5. **Destroy (Delete) a GCP VM Instance**
To delete a VM instance:
```bash
gcloud compute instances delete <instance-name> --zone=<zone>
```

---

### 6. **List Instances**
To view all instances in your project:
```bash
gcloud compute instances list
```

