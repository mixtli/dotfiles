ecr_login() {
  aws ecr get-login-password --region us-east-1 --profile dev | docker login --username AWS --password-stdin 411719562396.dkr.ecr.us-east-1.amazonaws.com
}
