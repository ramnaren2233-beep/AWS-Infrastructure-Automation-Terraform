# Task 8: GitHub Actions CI/CD for Terraform Deployment

| S.No | Stage | What I Did | Status |
| :---: | :--- | :--- | :---: |
| 1 | Checkout | Configured `actions/checkout` to pull the repository | ✅ Completed |
| 2 | Terraform Format | Added `terraform fmt -check -recursive` | ✅ Completed |
| 3 | Terraform Init | Initialized the Terraform working directory | ✅ Completed |
| 4 | Terraform Validate | Validated the configuration syntax | ✅ Completed |
| 5 | Terraform Plan | Generated the plan using `-out=tfplan` | ✅ Completed |
| 6 | Upload Plan Artifact | Uploaded `tfplan` as a workflow artifact | ✅ Completed |
| 7 | Manual Approval | Added `production` environment with required reviewers | ✅ Completed |
| 8 | Terraform Apply | Applied the saved plan after approval | ✅ Completed |
| 9 | Terraform Outputs | Displayed outputs using `terraform output` | ✅ Completed |
| 10 | Infrastructure Validation | Verified `task8_done.txt` and the Terraform state | ✅ Completed |

---

## 📸 Screenshots

| S.No | Screenshot File | Evidence For |
| :---: | :--- | :--- |
| 1 | `01-Checkout.png` | Repository checkout step |
| 2 | `02-Terraform-Format.png` | Terraform format check |
| 3 | `03-Terraform-Init.png` | Terraform initialization |
| 4 | `04-Terraform-Validate.png` | Terraform validation |
| 5 | `05-Terraform-Plan.png` | Terraform plan generation |
| 6 | `06-Plan-Artifact.png` | Plan uploaded as artifact |
| 7 | `07-Manual-Approval.png` | Manual approval gate |
| 8 | `08-Terraform-Apply.png` | Terraform apply after approval |
| 9 | `09-Terraform-Outputs.png` | Terraform outputs |
| 10 | `10-Infrastructure-Validation.png` | Post-deployment validation |

---

## 🔄 Workflow Overview

| Job | Steps | Notes |
| :--- | :--- | :--- |
| **plan** | Checkout → Setup Terraform → Format → Init → Validate → Plan → Upload Artifact | Runs automatically on push to `main` |
| **apply** | Checkout → Setup Terraform → Init → Download Artifact → Apply → Outputs → Validation | Pauses for manual approval (`production` environment) |

---

## ✅ Task 8 Completed

> **Task 8 completed successfully.**
> The GitHub Actions workflow executed the complete Terraform lifecycle. The pipeline paused at the Manual Approval gate and, once approved, deployed the infrastructure and completed the post-deployment validation. All run evidence is available in the `task-8-evidence` folder.
