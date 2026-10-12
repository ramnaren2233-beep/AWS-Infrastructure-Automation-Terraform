# Task 11: Terraform Plan & Artifact Verification

## 📋 Task Details

| Field | Details |
| :--- | :--- |
| **Task Name** | Task 11 - Terraform Plan & Artifact Management |
| **Tools Used** | GitHub Actions, Terraform |
| **Workflow File** | `.github/workflows/terraform.yml` |
| **Overall Status** | ✅ Completed |

---

## 🛠️ Execution Summary

| S.No | What I Did | Status |
| :---: | :--- | :---: |
| 1 | Configured `terraform plan -out=tfplan` in the GitHub Actions workflow | ✅ Completed |
| 2 | Added the `actions/upload-artifact@v4` step to upload the generated plan | ✅ Completed |
| 3 | Verified the `tfplan` file is available as a downloadable artifact on the workflow run | ✅ Completed |

---

## 📸 Screenshots (Run Evidence)

All screenshots are stored in the `task-11-evidence/` folder.

| S.No | Screenshot File |
| :---: | :--- |
| 1 | `Workflow-Run-and-Downloadable-Plan-Artifact.png` |

---

## ✅ Task 11 Completed

> **Task 11 completed successfully.**
> The GitHub Actions workflow generated the Terraform plan, saved it as `tfplan`, and uploaded it as an artifact. The artifact is visible and downloadable from the workflow run page.
