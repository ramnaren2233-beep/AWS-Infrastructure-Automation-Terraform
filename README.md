# AWS Infrastructure Automation using Terraform & GitHub Actions

Terraform infrastructure on AWS, deployed automatically through a GitHub Actions CI/CD pipeline with a manual approval gate before apply.

| Field | Details |
| :--- | :--- |
| **Tools Used** | Terraform, GitHub Actions, AWS |
| **Workflow File** | `.github/workflows/main.yml` |
| **Application URL** | http://13.203.111.201 *(reachable while the infrastructure is running)* |
| **Final Checklist** | [Z-Submission-Requirements/Report.md](./Z-Submission-Requirements/Report.md) |
| **Overall Status** | ✅ Completed |

---

## 📊 Project Flow (Task 1 to Task 16)

```text
📦 AWS-Infrastructure-Automation-Terraform
│
├── 🏗️ PHASE 1: Terraform Infrastructure (Task 1 - 7)
│   │
│   ├── 📂 Task-01  ── AWS Infrastructure Automation Using Terraform & GitHub Actions
│   │   ├── 📄 ec2.tf
│   │   ├── 📄 eip.tf
│   │   ├── 📄 iam.tf
│   │   ├── 📄 backend.tf
│   │   ├── 📄 .gitignore
│   │   └── 📄 README.md
│   │        │
│   │        ▼
│   ├── 📂 Task-02  ── Terraform Validity Outputs
│   ├── 📂 Task-03  ── Reusable Terraform Modules
│   ├── 📂 Task-04  ── Remote State & State Locking
│   ├── 📂 Task-05  ── EC2 Web Server Configuration
│   ├── 📂 Task-06  ── S3 Configuration
│   └── 📂 Task-07  ── AWS Security
│            (each: *.tf + modules + .gitignore + README.md)
│                │
│                ▼
├── 🔄 PHASE 2: GitHub Actions CI/CD (Task 8 - 15)
│   │
│   ├── 📂 .github/workflows/main.yml
│   │
│   ├── 📂 Task-08  ── Complete CI/CD Workflow
│   │        │
│   │        ▼
│   ├── 📂 Task-09  ── Terraform Format Check
│   ├── 📂 Task-10  ── Terraform Init & Validate
│   ├── 📂 Task-11  ── Terraform Plan & Artifact Upload
│   ├── 📂 Task-12  ── Manual Approval Before Apply
│   ├── 📂 Task-13  ── Terraform Apply
│   ├── 📂 Task-14  ── Terraform Outputs
│   └── 📂 Task-15  ── Automatic Trigger on Push
│            (each: README.md + screenshots + .gitignore)
│                │
│                ▼
├── ✅ PHASE 3: Final Validation (Task 16)
│   │
│   └── 📂 Task-16  ── Infrastructure Validation
│       ├── 🖼️ AWS Console evidence
│       ├── 🖼️ Working application URL evidence
│       └── 📄 README.md
│                │
│                ▼
└── 📂 Z-Submission-Requirements
    ├── 📄 Report.md   (Final submission checklist)
    ├── 🖼️ 01-AWS-Console-Evidence.png
    └── 🖼️ 02-Working-Application-URL-Evidence.png
```

---

## 🔄 CI/CD Pipeline

```text
 Push to main
      │
      ▼
 plan job:  Checkout → Setup Terraform → Format → Init → Validate → Plan → Upload Plan Artifact
      │
      ▼
 🛑 Manual Approval (production environment)
      │
      ▼
 apply job: Checkout → Setup Terraform → Init → Download Plan → Apply → Outputs → Validation
```

---

## 📚 Task List

| Task | Topic | Folder | Status |
| :---: | :--- | :--- | :---: |
| 1 | AWS Infrastructure Automation Using Terraform & GitHub Actions | [Task-01](./Task-01) | ✅ Completed |
| 2 | Terraform Validity Outputs | [Task-02](./Task-02) | ✅ Completed |
| 3 | Reusable Terraform Modules | [Task-03](./Task-03) | ✅ Completed |
| 4 | Remote State & State Locking | [Task-04](./Task-04) | ✅ Completed |
| 5 | EC2 Web Server Configuration | [Task-05](./Task-05) | ✅ Completed |
| 6 | S3 Configuration | [Task-06](./Task-06) | ✅ Completed |
| 7 | AWS Security | [Task-07](./Task-07) | ✅ Completed |
| 8 | GitHub Actions CI/CD for Terraform Deployment | [Task-08](./Task-08) | ✅ Completed |
| 9 | Terraform Formatting Verification | [Task-09](./Task-09) | ✅ Completed |
| 10 | Terraform Initialization & Validation | [Task-10](./Task-10) | ✅ Completed |
| 11 | Terraform Plan & Artifact | [Task-11](./Task-11) | ✅ Completed |
| 12 | Approval Before Apply | [Task-12](./Task-12) | ✅ Completed |
| 13 | Terraform Apply | [Task-13](./Task-13) | ✅ Completed |
| 14 | Terraform Outputs | [Task-14](./Task-14) | ✅ Completed |
| 15 | GitHub Actions Trigger | [Task-15](./Task-15) | ✅ Completed |
| 16 | Infrastructure Validation & Submission | [Task-16](./Task-16) | ✅ Completed |
