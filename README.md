# 🚀 AWS EC2 + Nginx Web Hosting Project  

This project hosts a **static website** on an **AWS EC2 instance** using **Nginx** as the web server. It includes:  
- **index.html** → The website homepage.  
- **nginx.conf** → The main Nginx configuration file.  
- **nginx-site.conf** → The site-specific Nginx configuration file.  
- **setup.sh** → A shell script to automate the setup process.  

## 📌 Features  
✅ Deploys a static website using Nginx.  
✅ Automates the Nginx installation and configuration.  
✅ Ensures proper directory structure for deployment.  
✅ Uses an `nginx-site.conf` file to define server behavior.  

---

## **🛠️ Setup Instructions**  

### **1️⃣ Launch an AWS EC2 Instance**  
1. Go to **AWS Console** → **EC2** → **Launch Instance**.  
2. Select **Amazon Linux 2** or **Ubuntu** as the OS.  
3. Choose instance type: `t2.micro` (free-tier eligible).  
4. Configure security group **(allow HTTP and SSH)**:  
   - Allow **port 22 (SSH)** from your IP.  
   - Allow **port 80 (HTTP)** from **anywhere (0.0.0.0/0)**.  
5. Click **Launch**, and download your `.pem` key.  

---

### **2️⃣ Connect to the EC2 Instance via SSH**  
On your **local machine**, open **Command Prompt (Windows) or Terminal (Mac/Linux)** and run:  
Run this command: `ssh -i "YourKey.pem" ec2-user@your-ec2-public-ip`


Replace YourKey.pem with your actual key filename and your-ec2-public-ip with the Public IPv4 Address of your EC2 instance
3️⃣ Transfer Files to EC2 (From Local Machine to Server)
To upload project files from your local machine to the EC2 instance, run the following command:

`scp -i "YourKey.pem" -r My-Project_Nginx ec2-user@your-ec2-public-ip:/home/ec2-user/`
This transfers the entire project directory to /home/ec2-user/.

4️⃣ Run the Setup Script to Install & Configure Nginx
Once inside the EC2 instance, navigate to the project folder:


`cd /home/ec2-user/My-Project_Nginx`
Run the setup.sh script to install and configure Nginx automatically:

`sudo chmod +x setup.sh  # Give execute permission
sudo ./setup.sh`
🔹 This script will:

Update system packages

Install Nginx

Copy configuration files to /etc/nginx/

Restart Nginx to apply changes

5️⃣ Verify That Nginx is Running
Check Nginx service status:

`sudo systemctl status nginx`
You should see something like:

● n`ginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
   Active: active (running) since ...`
If Nginx is not running, restart it manually:

`sudo systemctl restart nginx`

6️⃣ Test Your Website
Now, open your web browser and go to:

`http://your-ec2-public-ip`
You should see your custom website hosted on Nginx! 🎉

