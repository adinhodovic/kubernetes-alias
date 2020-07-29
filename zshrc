# ------------------------------------
# Kubernets aliases
#
# Note: We use kubectl default autocompletions but add a couple of aliases that I find useful
# ------------------------------------

##### Alias
alias ke="k exec "
alias keit="ke -it "
alias kd="k describe"

alias kdsm="kd servicemonitors"

alias kg="k get"

alias kgevt="kubectl get events --sort-by='.lastTimestamp'"

# $1 docker container name
# $2 image name
# $3 kubernetes namespace
# e.g kri curl-debug radial/busyboxplus:curl -n debug
kubectl_run_i() {
  local cmd="kubectl run $1 --image=$2 -i --rm --tty --command /bin/sh"
  if [ -n "$3" ];
  then
    cmd+=" -n $3"
  fi
  eval $cmd
}

kubectl_run_i_curl() {
  kubectl_run_i curl-debug radial/busyboxplus:curl $1;
}

alias kri="kubectl_run_i"
alias kri_curl="kubectl_run_i_curl"
