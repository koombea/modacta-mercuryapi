#!/usr/bin/env bash

set -euxo pipefail

# Terraform AWS ECS Deployment
cd deploy/environments/${ENVIRONMENT}/service
terraform init

terraform workspace select ${ENVIRONMENT}

export $(cat ${HOME}/env-vars/env.${ENVIRONMENT} | xargs) && terraform apply -auto-approve -var "docker_image_tag=${DOCKER_IMAGE_TAG}"


# JSON="{\"containerOverrides\":[{\"name\":\"rails\",\"command\":[\"rails\",\"db:migrate\"]}]}"
# aws --region ${AWS_DEFAULT_REGION} ecs run-task --cluster linc-${ENVIRONMENT} --task-definition $(aws --region ${AWS_DEFAULT_REGION} ecs list-task-definitions --family linc-${ENVIRONMENT} | jq -r '.taskDefinitionArns[0]') --overrides "${JSON}"
