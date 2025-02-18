### Pong Game on AWS
This project deploys a simple Pong game using Nginx on an AWS EC2 instance, provisioned using Terraform.

### 🚀 Features
Static Pong Game hosted on Nginx
Infrastructure as Code (IaC) with Terraform
Deployed on AWS EC2 with security best practices

### 📌 Prerequisites
AWS account
Terraform installed
SSH key configured for GitHub
Git installed

### 📂 Project Structure
├── game.js
├── index.html
├── style.css
├── main.tf          # Terraform configuration  
├── variables.tf     # Terraform variables  
├── .gitignore       # Ignore sensitive files  
└── README.md

### ⚡ Deployment Steps
1️⃣ Clone this repository
git clone git@github.com:Heero04/pong-game-aws.git
cd pong-game-aws

2️⃣ Initialize Terraform
terraform init
terraform apply -auto-approve

http://52.22.15.221/

### 📜 Troubleshooting
Game not loading?
    Check Nginx is running:
        sudo systemctl status nginx
    Restart if needed:
        sudo systemctl restart nginx

### Can't access via HTTPS?
    You need a domain & SSL (e.g., AWS ACM + ALB).