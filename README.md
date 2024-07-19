# AKnox-DevOps-Assignment

## Overview

This repository contains the implementation for the AKnox DevOps assignment. The main goal is to deploy a web application (`wisecow`) as a Kubernetes (k8s) application with Docker and Ingress, along with setting up GitHub Actions for continuous integration.

## Repository Structure

- `.github/workflows/` - Contains GitHub Actions workflows for automating builds and deployments.
- `Problem-Statement-2/` - Contains the solution for Problem 2, including implementation and related files.
- `Screenshots/` - Contains screenshots for validation output.
- `.DS_Store` - MacOS system file, not relevant for the project.
- `App.log` - Log file from the application.
- `Dockerfile` - Dockerfile for building the `wisecow` application image.
- `README.md` - This README file.
- `deployment.yaml` - Kubernetes Deployment manifest for deploying the `wisecow` application.
- `ingress.yaml` - Kubernetes Ingress manifest for exposing the `wisecow` application securely.
- `service.yaml` - Kubernetes Service manifest for exposing the `wisecow` application internally.
- `tls.crt` - TLS certificate for securing communication.
- `tls.key` - TLS private key for securing communication.
- `wisecow.sh` - Shell script that implements the `wisecow` web server.

## Prerequisites

Before deploying the application, ensure you have the following tools installed:

- Docker
- Kubernetes (kubectl)
- Helm (optional, if using Helm charts)
- GitHub CLI (for CI/CD workflows)

Additionally, for local testing, you need to install the following packages:

```bash
sudo apt install fortune-mod cowsay -y
```

## Setup and Installation

### Run the Application Locally:
First, run the wisecow.sh script: `./wisecow.sh`

Then, open your browser and navigate to `http://localhost:4499/` to access the application.

### Build Docker Image

To build the Docker image for the `wisecow` application, run:

```bash
docker build -t wisecow:latest .

```
### Deploy to Kubernetes
1. Create a Kubernetes Secret for TLS:
```bash
kubectl create secret tls wisecow-tls --cert=tls.crt --key=tls.key
```
2. Apply Kubernetes Manifests
3. Deploy the application using the following commands:
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```

## GitHub Actions
The GitHub Actions workflows are defined in `.github/workflows/`:
`docker-image.yml`: Automates Docker image building and pushing.

## Accessing the Application
1. Local Testing:
Access the application at `http://localhost:4499/`.
2. Ingress Access: If using a domain or local host configured in Ingress, access the application via the configured hostname.

## Contact
For any questions or issues, please contact me at navneetsatyamkumar@gmail.com.


