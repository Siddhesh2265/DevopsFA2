# Git-Based IaC & Multi-Environment Container Deployment

## Overview
This repository contains infrastructure as code (IaC) written in Terraform to provision a two-container application stack (Frontend Web Server & Backend REST API) across isolated environments (**QA**, **UAT**, and **PROD**) using Docker.

The project demonstrates multi-environment orchestration without duplicating infrastructure code, using variable files (`.tfvars`) to manage environment-specific configurations dynamically.

---

## Project Structure

```text
DevopsFA1/
│
├── docker/
│   ├── backend/
│   │   ├── Dockerfile
│   │   ├── index.js
│   │   └── package.json
│   └── frontend/
│       ├── Dockerfile
│       └── index.html
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── environments/
│       ├── qa.tfvars
│       ├── uat.tfvars
│       └── prod.tfvars
│
├── .gitignore
└── README.md