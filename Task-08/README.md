
# Task 8: GitHub Actions CI/CD for Terraform Deployment

## 📋 Task Details

| Field | Details |
| :--- | :--- |
| **Task Name** | Task 8 - GitHub Actions CI/CD for Terraform |
| **Tools Used** | GitHub Actions, Terraform |
| **Workflow File** | `.github/workflows/terraform.yml` |
| **Terraform Code** | `Task-08/main.tf` |
| **Overall Status** | ✅ Completed |

---

## 🛠️ Execution Summary

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

## 📸 Screenshots (Run Evidence)

All screenshots are stored in the `task-8-evidence/` folder.

| S.No | Screenshot File |
| :---: | :--- |
| 1 | `01-Checkout.png` |
| 2 | `02-Terraform-Format.png` |
| 3 | `03-Terraform-Init.png` |
| 4 | `04-Terraform-Validate.png` |
| 5 | `05-Terraform-Plan.png` |
| 6 | `06-Plan-Artifact.png` |
| 7 | `07-Manual-Approval.png` |
| 8 | `08-Terraform-Apply.png` |
| 9 | `09-Terraform-Outputs.png` |
| 10 | `10-Infrastructure-Validation.png` |

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
