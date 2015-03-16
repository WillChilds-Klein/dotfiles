# general tools


# FZF 
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# AWS 
# add aws bin directory to PATH
export PATH=$PATH:/usr/local/aws/bin

# export env vars
export AWS_CONFIG_FILE=~/.aws/config
export AWS_DEFAULT_PROFILE=default
#export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
#export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
#export AWS_DEFAULT_REGION=$(aws configure get region)

# set bash autocompletion
complete -C '/usr/local/bin/aws_completer' aws

# connect to zeus EC2 instance via ssh
alias zeus='ssh -i ~/.aws/athena-zeus.pem ubuntu@ec2-52-11-189-255.us-west-2.compute.amazonaws.com'

# vim-hackernews
alias hn='vim +HackerNews'
