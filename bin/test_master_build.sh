#!/usr/bin/env bash
repo=$(basename `pwd`)
ECR=411719562396.dkr.ecr.us-east-1.amazonaws.com/devspace/${repo}
echo 1
SHA8=$(git rev-parse --short=8 HEAD) 
echo 2
MASTER_DEVSPACE_IMAGE_NAME=$ECR:master DEVSPACE_REPO_IMAGE_NAME=$ECR:master-premerge-$SHA8 
echo 3
docker build -f dockerfiles/dev.dockerfile --build-arg BUNDLE_GITHUB__COM=$BUNDLE_GITHUB__COM -t ${MASTER_DEVSPACE_IMAGE_NAME} -t ${DEVSPACE_REPO_IMAGE_NAME} . 
echo 4
docker push ${DEVSPACE_REPO_IMAGE_NAME} 
echo 5
docker push ${MASTER_DEVSPACE_IMAGE_NAME}
