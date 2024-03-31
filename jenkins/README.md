## Jenkins Docker Image

This Dockerfile builds a Docker image for Jenkins based on Debian 12 (Slim).

### Dockerfile Steps:

1. **Base Image:** Uses `debian:12-slim` as the base image.
2. **Install Necessary Packages:** Installs `fontconfig`, `wget`, and `gnupg`.
3. **Install OpenJDK 17:** Installs OpenJDK 17 JRE.
4. **Add Jenkins Repository Key:** Downloads and adds the Jenkins repository key.
5. **Install Jenkins:** Installs Jenkins using the added repository.
6. **Expose Jenkins Port:** Exposes port 8080.
7. **Set Default Command:** Sets the default command to run Jenkins.

### Usage:

```bash
docker build -t jenkins .
docker run -d -p 8080:8080 jenkins


### Access Jenkins at http://localhost:8080 in your web browser.

