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
* **Docker** (for containerized applications)
* **Application Instances**: Ensure each application instance is running on a unique port.

---

## 🔧 Environment Variables

Configure the following environment variables:

* **`BASE_URL_S3`**: The base URL for S3 storage (e.g., `https://s3.amazonaws.com/your-bucket`)
* **`BASE_DOMAIN`**: The base domain for subdomain routing (e.g., `example.com`)
* **`BASE_EXTENSION`**: The extension or port mapping for application instances (e.g., `app`, `instance`)

---

## 🚀 Setup

### 1. Clone the Repository

```bash
git clone https://github.com/thiagofeijodev/proxy-frontend.git
cd proxy-frontend
```

### 2. Set Environment Variables

Create a `.env` file in the project root or export the variables:

```bash
export BASE_URL_S3="https://s3.amazonaws.com/your-bucket"
export BASE_DOMAIN="example.com"
export BASE_EXTENSION="app"
```

### 3. Install and Run with Docker

#### Build the Docker Image

```bash
docker build -t proxy-frontend:latest .
```

#### Run the Docker Container

```bash
docker run -d \
  --name proxy-frontend \
  -p 80:80 \
  -p 443:443 \
  -e BASE_URL_S3="$BASE_URL_S3" \
  -e BASE_DOMAIN="$BASE_DOMAIN" \
  -e BASE_EXTENSION="$BASE_EXTENSION" \
  proxy-frontend:latest
```

Or using the provided script:

```bash
chmod +x init-docker.sh
./init-docker.sh
```

### 5. Test Nginx Configuration

```bash
docker exec proxy-frontend nginx -t
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
