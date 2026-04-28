# Ecs-backend-nodejs-microservice

# ECS Backend Node.js Microservice

## 📌 Overview
This project demonstrates the deployment of a containerized Node.js backend microservice on AWS using a scalable and production-ready architecture. The application is designed following microservices principles and deployed using Amazon ECS with automated CI/CD pipelines.

---

## 🏗️ Architecture
The application follows a cloud-native microservices architecture:

- Node.js REST API (Dockerized)
- Amazon ECS (Fargate) for container orchestration
- Application Load Balancer (ALB) for traffic routing
- Amazon ECR for container image storage
- AWS CloudWatch for logging and monitoring
- GitHub Actions for CI/CD automation
- Terraform for infrastructure provisioning

---

## 🚀 Key Features
- Containerized Node.js backend using Docker  
- Scalable and serverless deployment with ECS Fargate  
- Load-balanced architecture using ALB  
- CI/CD pipeline for automated build and deployment  
- Centralized logging and monitoring with CloudWatch  
- Environment-based configuration support  

---

## 🧰 Tech Stack
- **Backend:** Node.js  
- **Containerization:** Docker  
- **Cloud:** AWS (ECS, ECR, ALB, CloudWatch)  
- **IaC:** Terraform  
- **CI/CD:** GitHub Actions  

---

## ⚙️ CI/CD Workflow
1. Code pushed to GitHub  
2. GitHub Actions builds Docker image  
3. Image pushed to Amazon ECR  
4. ECS service updated with new image  
5. Rolling deployment with zero downtime  

---

## 📊 Observability
- CloudWatch Logs for application logging  
- Metrics and alarms for CPU/Memory usage  
- Alerts for application failures  

---

## 🔐 Security Best Practices
- No hardcoded secrets in repository  
- Sensitive values managed via environment variables / AWS Secrets Manager  
- IAM roles used for service permissions  

---

## 🧪 How to Run Locally
```bash
git clone <repo-url>
cd project
docker build -t node-app .
docker run -p 3000:3000 node-app

**Use Case**

This project simulates a real-world backend service deployed in a scalable and fault-tolerant cloud environment, suitable for high-availability applications.

          Users
            |
            ▼
   ┌────────────────────┐
   │ Application Load   │
   │ Balancer (ALB)     │
   └────────────────────┘
            |
            ▼
   ┌────────────────────┐
   │   ECS Service      │
   │  (Fargate Tasks)   │
   └────────────────────┘
            |
            ▼
   ┌────────────────────┐
   │   Node.js App      │
   │   (Dockerized)     │
   └────────────────────┘
            |
            ▼
   ┌────────────────────┐
   │   CloudWatch Logs  │
   └────────────────────┘


CI/CD Flow:
GitHub → GitHub  → ECR → ECS Deployment
