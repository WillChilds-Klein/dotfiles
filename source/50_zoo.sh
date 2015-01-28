# aliases etc. for working on Yale's zoo computing cluster

# zoo vars
export ZOO_USR='wdc22'
export ZOO_HOST='node.zoo.cs.yale.edu'
export ZOO_HOME='/home/accts/wdc22'

# zoo remote stuff
alias zoo='ssh -Y wdc22@node.zoo.cs.yale.edu'
alias zoo-run='remote-run $ZOO_USR $ZOO_HOST $ZOO_HOME $@'