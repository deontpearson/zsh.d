alias watch='watch '
#---------------------------------------------------------------------------------------------------
alias tm='tmuxinator '
#---------------------------------------------------------------------------------------------------
alias jumpbox-production='ssh jumpbox-production'
alias bastion-production='ssh bastion-production'
#---------------------------------------------------------------------------------------------------
alias kc='kubectl'
alias kcl='kubectl --context minikube'
alias kcevict='kubectl --context docker-desktop get pod --all-namespaces --field-selector 'status.phase!=Running' -o json | kubectl delete -f -'
#---------------------------------------------------------------------------------------------------
alias ks='kubeseal'
alias ksl='kubeseal --context minikube'
#---------------------------------------------------------------------------------------------------
alias jiramaker='python ~/workspace/uxi-tools/jiramaker'
