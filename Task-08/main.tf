name: Terraform CI/CD

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read

jobs:
  terraform:
    name: Terraform Lifecycle
    runs-on: ubuntu-latest

    steps:
      - name: 1. Checkout Code
        uses: actions/checkout@v4

      - name: 2. Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.5.0

      - name: 3. Locate Terraform Configuration
        id: locate
        shell: bash
        run: |
          echo "Repository directory:"
          pwd
          echo "Files in repository:"
          ls -la
          echo "Terraform configuration files:"
          find . -type f -name "*.tf" \
            -not -path "./.git/*" \
            -not -path "./.terraform/*"

          if [ -f main.tf ]; then
            echo "tfdir=." >> "$GITHUB_OUTPUT"
          elif [ -f terraform/main.tf ]; then
            echo "tfdir=terraform" >> "$GITHUB_OUTPUT"
          else
            echo "::error::main.tf not found in repository root or terraform/ directory."
            exit 1
          fi

      - name: 4. Terraform Format
        working-directory: ${{ steps.locate.outputs.tfdir }}
        run: terraform fmt -check -recursive

      - name: 5. Terraform Init
        working-directory: ${{ steps.locate.outputs.tfdir }}
        run: terraform init

      - name: 6. Terraform Validate
        working-directory: ${{ steps.locate.outputs.tfdir }}
        run: terraform validate

      - name: 7. Terraform Plan
        working-directory: ${{ steps.locate.outputs.tfdir }}
        run: terraform plan -no-color -out=tfplan

      - name: 8. Upload Plan Artifact
        uses: actions/upload-artifact@v4
        with:
          name: terraform-plan
          path: ${{ steps.locate.outputs.tfdir }}/tfplan
          if-no-files-found: error
          retention-days: 5

  terraform-apply:
    name: Manual Approval and Apply
    needs: terraform
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    environment: terraform-production

    steps:
      - name: 1. Checkout Code
        uses: actions/checkout@v4

      - name: 2. Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.5.0

      - name: 3. Locate Terraform Configuration
        id: locate
        shell: bash
        run: |
          if [ -f main.tf ]; then
            echo "tfdir=." >> "$GITHUB_OUTPUT"
          elif [ -f terraform/main.tf ]; then
            echo "tfdir=terraform" >> "$GITHUB_OUTPUT"
          else
            echo "::error::main.tf not found."
            exit 1
          fi

      - name: 4. Terraform Init
        working-directory: ${{ steps.locate.outputs.tfdir }}
        run: terraform init

      - name: 5. Download Plan Artifact
        uses: actions/download-artifact@v4
        with:
          name: terraform-plan
          path: ${{ steps.locate.outputs.tfdir }}

      - name: 6. Terraform Apply
        working-directory: ${{ steps.locate.outputs.tfdir }}
        run: terraform apply -auto-approve tfplan

      - name: 7. Terraform Outputs
        working-directory: ${{ steps.locate.outputs.tfdir }}
        run: terraform output

      - name: 8. Infrastructure Validation
        run: |
          echo "Terraform apply completed."
          echo "Review Terraform outputs and AWS Console to verify resources."
