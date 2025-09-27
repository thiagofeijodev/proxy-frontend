# 🌐 Multi-Instance App Routing with Nginx

An Nginx configuration that dynamically routes subdomains to separate instances of the same application, each running on a different port. Ideal for multi-tenant environments, testing, or scaling applications without manual configuration for each subdomain.

---

## 📌 Features

* **Dynamic Subdomain Routing**: Automatically routes subdomains like `app1.example.com`, `app2.example.com`, etc., to their respective application instances.
* **Scalable Architecture**: Easily scale by adding new application instances and corresponding subdomains without modifying the Nginx configuration.
* **Simplified Management**: Manage multiple application instances through a single Nginx configuration, reducing complexity and potential for errors.

---

## ⚙️ Requirements

* **Nginx**
* **Docker** (optional, for containerized applications)
* **Application Instances**: Ensure each application instance is running on a unique port.

---

## 🚀 Setup

### 1. Clone the Repository

```bash
git clone https://github.com/thiagofeijodev/proxy-frontend.git
cd proxy-frontend
```

### 2. Configure Nginx

Edit the `nginx.conf` file to define server blocks for each subdomain and map them to the corresponding application instance ports.

### 3. Start Nginx

```bash
sudo nginx -t   # Test configuration
sudo systemctl reload nginx   # Apply changes
```

### 4. (Optional) Use Docker

If your application instances are containerized, you can use Docker to manage them. Ensure each container is mapped to a unique port and update the Nginx configuration accordingly.

---

## 📄 Example Nginx Configuration

```nginx
server {
    listen 80;
    server_name app1.example.com;

    location / {
        proxy_pass http://127.0.0.1:3001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

server {
    listen 80;
    server_name app2.example.com;

    location / {
        proxy_pass http://127.0.0.1:3002;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

This configuration routes requests from `app1.example.com` to the application instance running on port 3001 and requests from `app2.example.com` to the instance on port 3002.

---

## 🔄 Scaling the Application

To add a new application instance:

1. **Deploy** a new instance of your application on a unique port (e.g., port 3003).
2. **Update** the Nginx configuration to include a new server block for the new subdomain and port.
3. **Reload** Nginx to apply the changes:

```bash
sudo systemctl reload nginx
```

---

## 🛠️ Customization

Feel free to modify the Nginx configuration to suit your specific needs:

* **SSL/TLS**: Add SSL certificates for secure HTTPS connections.
* **Load Balancing**: Implement load balancing strategies if needed.
* **Access Control**: Set up authentication or IP whitelisting as required.

---

## 📚 Resources

* [Nginx Documentation](https://nginx.org/en/docs/)
* [Docker Documentation](https://docs.docker.com/)
* [Application Deployment Guides](#) (Link to your application's deployment documentation)

---

## 🧑‍💻 Contributing

Contributions are welcome! Please fork the repository, create a new branch, and submit a pull request with your proposed changes.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
