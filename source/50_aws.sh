# add aws bin directory to PATH
export PATH=/usr/local/aws/bin:$PATH

# export env vars
export AWS_ACCESS_KEY_ID=AKIAJVV4GL7JCEYUW3DQ
export AWS_SECRET_ACCESS_KEY=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
export AWS_DEFAULT_REGION=us-west-2
export AWS_CONFIG_FILE=~/.aws/config

# set bash autocompletion
complete -C '/usr/local/bin/aws_completer' aws
