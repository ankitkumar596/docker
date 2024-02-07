#!/bin/bash
set -x
# Variables
REGION="ap-south-1"
REPOSITORY="sarvam"
ACCOUNT_ID="515787256781"
TASK_DEFINITION="ecs-task-definition"
NEW_IMAGE="mysql:latest"
CONTAINER_NAME="mysql"

# Generate a unique build ID (timestamp)
BUILD_ID=$(date +%Y%m%d%H%M%S)

# Authenticate Docker to ECR
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

# Pull the new image
docker pull $NEW_IMAGE

# Tag the new image
docker tag $NEW_IMAGE $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY:$BUILD_ID

# Push the new image to ECR
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY:$BUILD_ID

# Update the image in the task definition JSON file
OLD_IMAGE=$(cat /home/lenevo-ideapad/task_definition.json | jq -r '.containerDefinitions[0].image')
NEW_IMAGE="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY:$BUILD_ID"
sed -i "s|$OLD_IMAGE|$NEW_IMAGE|g" /home/lenevo-ideapad/task_definition.json

# Register a new revision of the task definition
NEW_REVISION=$(aws ecs register-task-definition \
  --region $REGION \
  --family $TASK_DEFINITION \
  --cli-input-json file:///home/lenevo-ideapad/task_definition.json | jq '.taskDefinition.taskDefinitionArn' -r)

echo "Task definition updated with new image: $NEW_IMAGE"
