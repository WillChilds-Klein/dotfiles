alias srcaws='vim $DOTFILES/source/50_aws.sh && src aws'

# don't source this file if aws cli isn't installed
which aws &>/dev/null || exit 1

aws_env() {
    # export AWS creds env vars from system-configured creds
    export AWS_ACCESS_KEY_ID="$(aws configure get aws_access_key_id)"
    export AWS_SECRET_ACCESS_KEY="$(aws configure get aws_secret_access_key)"

    # export keypair name to use
    export AWS_KEYPAIR_NAME="aws-master"
    export AWS_KEYPAIR_LOCAL_PATH="~/.ssh/${AWS_KEYPAIR_NAME}.pem"
}
