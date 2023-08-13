export CA_ACCOUNT=220211432420
export CA_DOMAIN=connect-appen 
export CA_REPO=appen-connect-repo
export CA_NAMESPACE=com.appen.connect

function ca_login {
  export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact --region us-west-2 get-authorization-token --domain $CA_DOMAIN --domain-owner $CA_ACCOUNT --query authorizationToken --output text`
}

function ca_list_packages {
  aws codeartifact --region us-west-2 list-packages --domain $CA_DOMAIN --domain-owner $CA_ACCOUNT --repository $CA_REPO
}

function ca_list_package_versions {
  aws codeartifact --region us-west-2 list-package-versions --domain $CA_DOMAIN --domain-owner $CA_ACCOUNT --repository $CA_REPO --format maven --namespace $CA_NAMESPACE --package $1 
}

function ca_list_package_assets {

  aws codeartifact --region us-west-2 list-package-version-assets --domain $CA_DOMAIN --domain-owner $CA_ACCOUNT --repository $CA_REPO --format maven --namespace $CA_NAMESPACE --package $1 --package-version $2 
}

function ca_get_package_asset {
  aws codeartifact --region us-west-2 get-package-version-asset --domain $CA_DOMAIN --domain-owner $CA_ACCOUNT --repository $CA_REPO --format maven --namespace $CA_NAMESPACE --package $1 --package-version $2 --asset $3 $3
}
