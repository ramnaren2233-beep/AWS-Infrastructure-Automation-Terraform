# Task 16: Infrastructure-Validation & Submission-Verification

## 📋 Task Details

| Field | Details |
| :--- | :--- |
| **Task Name** | Task 16 - Final Infrastructure Validation |
| **Tools Used** | GitHub Actions, Terraform, AWS |
| **Workflow File** | `.github/workflows/terraform.yml` |
| **Application URL** | `http://13.203.111.201` |
| **Overall Status** | ✅ Completed |

---

## 🔍 Verified AWS Resources

| S.No | Resource | Details | Status |
| :---: | :--- | :--- | :---: |
| 1 | EC2 Instance | `Project-03-Web-Server` is in the Running state | ✅ Verified |
| 2 | Elastic IP | `13.203.111.201` is attached to the EC2 instance | ✅ Verified |
| 3 | Web Server | Nginx serves the application over HTTP | ✅ Verified |
| 4 | S3 Bucket | Used as the Terraform remote state backend | ✅ Verified |
| 5 | IAM Role | `Project-03-EC2-Role` is attached to the instance | ✅ Verified |
| 6 | Security Group | Inbound HTTP traffic is allowed | ✅ Verified |
| 7 | Terraform Outputs | Instance ID and VPC ID are displayed after apply | ✅ Verified |

---

## 🛠️ Execution Summary

| S.No | What I Did | Status |
| :---: | :--- | :---: |
| 1 | Verified the deployed resources in the AWS Console | ✅ Completed |
| 2 | Confirmed the Elastic IP is attached to the EC2 instance | ✅ Completed |
| 3 | Opened the public URL in a browser and confirmed the application responds | ✅ Completed |

---


## 📸 Screenshots (Run Evidence)

All screenshots are stored in the `task-16-submission-evidence/` folder.

| S.No | Screenshot File |
| :---: | :--- |
| 1 | `01-AWS-Console-Evidence.png` |
| 2 | `02-Working-Application-URL-Evidence.png` |

---

## ✅ Task 16 Completed

> **Task 16 completed successfully.**
> The infrastructure was deployed through the GitHub Actions workflow. The EC2 instance is running, the Elastic IP is attached, and the application responds on `http://13.203.111.201`.
