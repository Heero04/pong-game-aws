# 🚀 Pong Game on AWS - Deployment Guide  

## 📌 Overview  
This project deploys a simple **Pong Game** using **Nginx on AWS EC2**, provisioned with **Terraform**.  
The infrastructure follows **best security practices**, including **firewall rules, SSH restrictions, and least privilege IAM policies**.  

---

## 🌟 Features  
✅ **Static Pong Game** hosted on Nginx  
✅ **Terraform for Infrastructure as Code (IaC)**  
✅ **Secure EC2 Instance with Security Groups & IAM Policies**  
✅ **HTTP Access (Port 80) with Option to Add HTTPS**  
✅ **Automated Deployment with Terraform**  

---

## 🔒 Security Best Practices  
🔹 **Limited SSH Access**: Only your IP can SSH into the EC2 instance (set in variables.tf).  
🔹 **Least Privilege IAM Role**: The EC2 instance is not running as root.  
🔹 **Firewall Protection**: Only HTTP (80) and SSH (22) are open, restricted by security groups.  
🔹 **No Hardcoded Credentials**: Sensitive data is ignored via .gitignore.  
🔹 **HTTPS Option**: You can use AWS ACM and a Load Balancer for HTTPS.  

---

## 📋 Prerequisites  
Before you deploy, make sure you have:  

🔹 **AWS CLI Installed & Configured** (aws configure)  
🔹 **Terraform Installed** (terraform -v to check)  
🔹 **SSH Key Configured for GitHub**  
🔹 **Git Installed** (git --version to check)  

---

## 📂 Project Structure  
📂 pong-game-aws
├── game.js

├── index.html

├── style.css

├── main.tf # Terraform configuration

├── variables.tf # Terraform variables

├── .gitignore # Ignore sensitive files

└── README.md


---

## ⚡ Deployment Steps  

### 1️⃣ Clone the Repository  
bash
git clone git@github.com:Heero04/pong-game-aws.git
cd pong-game-aws

### 2️⃣ Initialize Terraform
terraform init

### 3️⃣ Set Up Your AWS Region & IP

    variable "aws_region" {
     default = "us-east-1"
    }

    variable "my_ip" {
      description = "Your IP"
      type        = string
    }

### 4️⃣ Deploy Infrastructure
Run Terraform to create the AWS resources:
terraform apply -auto-approve

🚀 This will create:
✅ An EC2 instance with Nginx installed
✅ Security Group allowing only HTTP (80) & SSH (22) from your IP
✅ Infrastructure as Code (IaC)

### 5️⃣ Verify Deployment
Once complete, copy the EC2 Public IP from Terraform output and open it in a browser:
    http://<YOUR_EC2_PUBLIC_IP>
    Example: 👉 http://52.22.15.221/
    
#### ✅ Testing & Verification
🔹 Confirm Nginx is Running
    sudo systemctl status nginx

#### Restart Nginx if Needed
    sudo systemctl restart nginx

### ❓ Troubleshooting
### ❌ Game Not Loading?

Check if Nginx is running:  
    sudo systemctl status nginx

If not, restart it:
    sudo systemctl restart nginx

### 🔒 Can't SSH into EC2?
Check Your Security Group: Ensure your IP is whitelisted in AWS Security Groups.
Confirm Your Key: Use the correct SSH key to connect.
    ssh -i my-key.pem ec2-user@<YOUR_EC2_PUBLIC_IP>

### 🌐 Need HTTPS?
You need a domain name and an SSL certificate.

Use AWS ACM to create a free SSL cert
Deploy an Application Load Balancer (ALB)
Redirect HTTP to HTTPS

🛑 Destroying Infrastructure
To remove all AWS resources created by Terraform:
    terraform destroy -auto-approve

🚨 Warning: This will delete your EC2 instance & security groups!

### 🤝 Contributing
Have ideas for improvements? Fork this repo and submit a Pull Request!

## 📜 Future Enhancements  

### 🔹 1️⃣ Add HTTPS Support with Load Balancer (SSL/TLS)  
- Use **AWS Application Load Balancer (ALB)** for secure traffic.  
- Attach an **SSL certificate from AWS Certificate Manager (ACM)** for HTTPS.  

### 🔹 2️⃣ Automate Deployment with CI/CD  
- Use **GitHub Actions** or **AWS CodePipeline** to auto-deploy changes.  
- Automate `terraform apply` to reduce manual steps.  

### 🔹 3️⃣ Reduce Costs with S3 + CloudFront  
- **Current Issue:** EC2 stays **ON** and costs money.  
- **Solution:** Host the Pong game as a **static website on S3** and serve it via **CloudFront CDN**.  
- **Benefit:** Costs **< $5/month** and scales automatically.  

### 🔹 4️⃣ Auto-Start EC2 When Accessed  
- **Current Issue:** If EC2 is stopped, the site won’t load.  
- **Solution:** Create an **AWS Lambda function** to start EC2 when traffic is detected.  
- **Alternative:** Use **AWS Auto Scaling** to create instances **only when needed**.  

### 🔹 5️⃣ Add AWS Budget & Cost Monitoring  
- Set up **AWS Budgets** to track and control spending.  
- Get alerts if costs exceed **$5/month**.  
- Stop **Elastic IP charges** by detaching unused IPs.  

### 🔹 6️⃣ Implement Authentication & Multiplayer Features  
- Use **AWS Cognito** to add **user authentication**.  
- Upgrade game to **multiplayer** using WebSockets or **API Gateway + Lambda**.
