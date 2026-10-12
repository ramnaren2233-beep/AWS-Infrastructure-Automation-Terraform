# Task 10: Terraform-Initialization & Validation-Verification

## 📋 Task Details

| Field | Details |
| :--- | :--- |
| **Task Name** | Task 10 - Terraform Initialization & Validation |
| **Tools Used** | GitHub Actions, Terraform |
| **Workflow File** | `.github/workflows/terraform.yml` |
| **Overall Status** | ✅ Completed |

---

## 🛠️ Execution Summary

| S.No | What I Did | Status |
| :---: | :--- | :---: |
| 1 | Configured the `terraform init` step in the GitHub Actions workflow | ✅ Completed |
| 2 | Configured the `terraform validate` step in the GitHub Actions workflow | ✅ Completed |
| 3 | Verified successful initialization and provider download in the logs | ✅ Completed |
| 4 | Ensured a failing validation stops the workflow from continuing | ✅ Completed |

---

## 📸 Screenshots (Run Evidence)

All screenshots are stored in the `task-10-evidence/` folder.

| S.No | Screenshot File |
| :---: | :--- |
| 1 | `01-GitHub-Actions-Logs.png` |
| 2 | `02-Terraform-Init.png` |
| 3 | `03-Terraform-Validate.png` |

---

## ✅ Task 10 Completed

> **Task 10 completed successfully.**
> The GitHub Actions workflow ran `terraform init` and `terraform validate` successfully. Both steps passed without errors, and the workflow is configured so that a failure in either step stops the remaining steps from running.
