if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x KUBECONFIG $HOME/.kube/configs/*
end
