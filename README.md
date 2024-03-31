# Docker Installation Script for Ubuntu

This script automates the installation of Docker on Ubuntu systems.

## Prerequisites

- Ubuntu operating system
- `apt` package manager

## Usage

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/ankitkumar596/docker.git
    ```

2. **Navigate to the Directory:**

    ```bash
    cd docker
    ```

3. **Make the Script Executable:**

    ```bash
    chmod +x install_docker.sh
    ```

4. **Execute the Script:**

    ```bash
    ./install_docker.sh
    ```

## What does the script do?

- Updates the system packages using `apt-get update` and `apt-get upgrade`.
- Installs Docker dependencies including `apt-transport-https`, `ca-certificates`, `curl`, and `software-properties-common`.
- Adds Docker's official GPG key to verify package integrity.
- Adds Docker repository to the system's list of package sources.
- Updates package information and installs Docker packages (`docker-ce`, `docker-ce-cli`, `containerd.io`).
- Starts the Docker service using `systemctl start docker`.
- Enables Docker to start on system boot using `systemctl enable docker`.

## Contributing

If you find any issues with the script or have suggestions for improvements, feel free to open an issue or submit a pull request.
