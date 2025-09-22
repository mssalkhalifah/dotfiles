if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x KUBECONFIG $HOME/.kube/config/*
    set -x PATH $PATH:/opt/nvim-linux-x86_64/bin

    # aliases
    alias ll="ls -la"
end
