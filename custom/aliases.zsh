alias watch='watch '
#---------------------------------------------------------------------------------------------------
alias tm='tmuxinator '
#---------------------------------------------------------------------------------------------------
alias lg='ls -lAh | grep '
#---------------------------------------------------------------------------------------------------
alias jumpbox-production='ssh jumpbox-production'
alias jumpbox-staging='ssh jumpbox-staging'
alias bastion-production='ssh bastion-production'
alias bastion-staging='ssh bastion-staging'
#---------------------------------------------------------------------------------------------------
alias kc='kubectl'
alias kcl='kubectl --context minikube'
alias kcevict='kubectl --context docker-desktop get pod --all-namespaces --field-selector 'status.phase!=Running' -o json | kubectl delete -f -'
#---------------------------------------------------------------------------------------------------
alias ks='kubeseal'
alias ksl='kubeseal --context minikube'
#---------------------------------------------------------------------------------------------------
alias scurl='curl -s '
alias jiramaker='python ~/workspace/uxi-tools/jiramaker'
