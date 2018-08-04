# this contains a bunch of scripts
export PATH=$PATH:/Users/grayt13/Library/Python/2.7/bin
# export PATH=$PATH:/usr/local/Cellar/python@2/2.7.14_3/bin
export PATH=$PATH:/Users/grayt13/modav/dev-tools/bin
export PATH=$PATH:/Users/grayt13/modav/modav-infrastructure-util

export BBC_CA_FILE="/private/etc/pki/ca-bundle.pem"
export BBC_PEM_KEY="/private/etc/pki/certificate.pem"
export BBC_P12_KEY="/private/etc/pki/cert.p12:cert"

# wormhole variables
export AWS_DEFAULT_REGION=eu-west-1
export AWS_CONFIG_DIR=~/.aws_config

export CLOUD_ID="grayt13"

alias venv="source /Users/grayt13/modav/mediaservices-troposphere/venv/bin/activate"

# function for updating just config (copying from svn to S3) - input env
justconfig () {
  case $1 in
    "int" | "test" | "stage" | "live" )
      cosmos-ssh-to-any just-configurator $1 "curl -X POST http://localhost:8080/api/run"
      ;;
    * )
      echo "Specify an environment int|test|stage|live"
  esac
}

export PYTHONPATH=$HOME/modav/AWS-CloudFormation/src:$HOME/modav/mediaservices-cloudformation:$HOME/modav/BBC-CloudFormation/Common/trunk/src/
export PATH=$HOME/modav/BBC-CloudFormation/modav-infrastructure-util:$PATH
