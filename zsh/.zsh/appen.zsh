#SANDBOX_HOSTS=(ec2-54-165-34-242.compute-1.amazonaws.com ec2-52-202-201-50.compute-1.amazonaws.com ec2-52-90-230-155.compute-1.amazonaws.com ec2-34-201-98-213.compute-1.amazonaws.com) SANDBOX_HOSTS=(ec2-52-23-209-171.compute-1.amazonaws.com ec2-174-129-54-27.compute-1.amazonaws.com ec2-54-152-153-168.compute-1.amazonaws.com ec2-107-21-88-2.compute-1.amazonaws.com)
#SANDBOX_HOSTS=$(aws ec2 describe-instances --region us-east-1 --output text --filter "Name=tag:Name,Values=sandbox-ecs" --query 'Reservations[*].Instances[*].PublicDnsName' | tr '\n' ' ')
#
SANDBOX_HOSTS=(ec2-52-54-149-174.compute-1.amazonaws.com ec2-107-23-248-127.compute-1.amazonaws.com ec2-54-91-246-43.compute-1.amazonaws.com ec2-54-197-16-207.compute-1.amazonaws.com ec2-54-152-35-5.compute-1.amazonaws.com ec2-54-175-163-154.compute-1.amazonaws.com ec2-54-242-220-154.compute-1.amazonaws.com)

function ssh_sandbox() {
  for host in $SANDBOX_HOSTS; do
    match=$(docker --tlsverify -H ${host}:2376 ps | grep $1)
    if [[ -n $match ]]; then
      container_id=$(echo $match | cut -d ' ' -f 1)
      docker --tlsverify -H $host:2376 exec -ti $container_id bash
      break
    fi
  done
}


function grep_sandbox() {
  for host in $SANDBOX_HOSTS; do
    echo $host
    docker --tlsverify -H ${host}:2376 ps | grep $1
  done
}

function ps_sandbox() {
  for host in $SANDBOX_HOSTS; do
    echo $host
    docker --tlsverify -H ${host}:2376 ps 
  done
}

function run_keyserver() {
  docker run -d --rm --name ssh-keyserver 411719562396.dkr.ecr.us-east-1.amazonaws.com/ssh-keyserver:latest || true 
  export keyserver_host=$(docker inspect --format='{{.NetworkSettings.IPAddress}}' ssh-keyserver)
}


# function ecr_login() {
#   $(aws ecr get-login --no-include-email --region us-east-1)
# }
function ecr_login() {
  aws ecr get-login-password --region us-east-1 --profile dev | docker login --username AWS --password-stdin 411719562396.dkr.ecr.us-east-1.amazonaws.com
}
alias connect-aws='cd /Users/rmcclain/Applications/aws-cli-utilities-master/AWS\ CLI\ -\ Idaptive\ V1;python3 -m AWSCLI -t appen.my'

export AWS_PROFILE=dev


function restart_ambassador() {
  kubectl rollout restart deployment edge-stack -n ambassador
}

function branch_cleanup() {
  git branch --merged | egrep -v "(^\*|master|sandbox|integration)" | xargs git branch -d
}
