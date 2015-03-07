# add aws bin directory to PATH
export PATH=/usr/local/aws/bin:$PATH

# export env vars
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-west-2
export AWS_CONFIG_FILE=~/.aws/config

# set bash autocompletion
complete -C '/usr/local/bin/aws_completer' aws
