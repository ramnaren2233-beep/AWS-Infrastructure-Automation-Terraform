# Task 12: Approval-Before-Apply-Verification

## 📋 Task Details

| Field | Details |
| :--- | :--- |
| **Task Name** | Task 12 - Approval Before Apply |
| **Tools Used** | GitHub Actions, Terraform |
| **Workflow File** | `.github/workflows/terraform.yml` |
| **Overall Status** | ✅ Completed |

---

## 🛠️ Execution Summary

| S.No | What I Did | Status |
| :---: | :--- | :---: |
| 1 | Added `environment: production` to the apply job in the workflow | ✅ Completed |
| 2 | Configured required reviewers so a manual approval is needed before apply | ✅ Completed |
| 3 | Verified the workflow pauses at the apply job until an authorized user approves | ✅ Completed |

---

## 📸 Screenshots (Run Evidence)

All screenshots are stored in the `task-12-evidence/` folder.

| S.No | Screenshot File |
| :---: | :--- |
| 1 | `GitHub-Actions-Environment-Approval.png` |

---

## ✅ Task 12 Completed

> **Task 12 completed successfully.**
> The workflow paused before the apply job and waited for manual approval through the `production` environment. After the reviewer approved the deployment, the apply job ran.
