alias watch='watch '
#---------------------------------------------------------------------------------------------------
alias tm='tmuxinator '
#---------------------------------------------------------------------------------------------------
alias lg='ls -lAh | grep '
#---------------------------------------------------------------------------------------------------
alias jumpbox='ssh jumpbox'
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
alias sternl='stern --context minikube'
#---------------------------------------------------------------------------------------------------
alias helml='helm --kube-context minikube'
