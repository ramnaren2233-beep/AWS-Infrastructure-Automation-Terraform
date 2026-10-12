name: Terraform CI/CD Automation

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read

jobs:
  terraform-plan:
    name: Terraform Format, Validate and Plan
    runs-on: ubuntu-latest

    steps:
      - name: 1. Checkout Source Code
        uses: actions/checkout@v4

      - name: 2. Locate Terraform Configuration
        id: locate
        shell: bash
        run: |
          echo "Current directory:"
          pwd
          echo "Terraform files:"
          find . -type f -name "*.tf" \
            -not -path "./.git/*" \
            -not -path "./.terraform/*"
          if [ -f main.tf ]; then
            echo "tfdir=." >> "$GITHUB_OUTPUT"
          elif [ -f terraform/main.tf ]; then
            echo "tfdir=terraform" >> "$GITHUB_OUTPUT"
          else
            echo "ERROR: main.tf not found at repository root or terraform/"
            exit 1
          fi

      - name: 3. Setup Terraform
        uses: hashicorp/setup-terraform@v3

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
        run: terraform plan -out=tfplan

      - name: 8. Upload Plan Artifact
        uses: actions/upload-artifact@v4
        with:
          name: terraform-plan
          path: ${{ steps.locate.outputs.tfdir }}/tfplan
          retention-days: 5

  terraform-apply:
    name: Manual Approval and Apply
    needs: terraform-plan
    runs-on: ubuntu-latest
    environment: terraform-production

    steps:
      - name: 1. Checkout Source Code
        uses: actions/checkout@v4

      - name: 2. Setup Terraform
        uses: hashicorp/setup-terraform@v3

      - name: 3. Locate Terraform Configuration
        id: locate
        shell: bash
        run: |
          if [ -f main.tf ]; then
            echo "tfdir=." >> "$GITHUB_OUTPUT"
          elif [ -f terraform/main.tf ]; then
            echo "tfdir=terraform" >> "$GITHUB_OUTPUT"
          else
            echo "ERROR: main.tf not found"
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
