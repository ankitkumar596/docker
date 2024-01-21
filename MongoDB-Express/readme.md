## Accessing MongoDB Database in Docker

This guide outlines the steps to access a MongoDB database running within a Docker environment. Follow these steps to interact with the MongoDB database using the terminal.

### Prerequisites

- Docker installed on your system ([Install Docker](https://docs.docker.com/get-docker/))

### Steps

Run the following command to list the running Docker containers and connect to the mongodb

```bash

1. list the running container's
docker ps

2. Access MongoDB Container
docker exec -it container_name bash

3. Connect to MongoDB Database
mongosh -u username -p password

4. Run MongoDB Commands
# Show available databases
show dbs

# Switch to a specific database
use your_database_name

# List collections in the current database
show collections

# Run queries or updates
db.your_collection_name.find()
