set -x SSH_AUTH_SOCK $HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x KUBECONFIG $HOME/.kube/*.conf
    # set -x PATH $PATH:/opt/nvim-linux-x86_64/bin
    # set -x PATH $PATH:/home/mssalkhalifah/.dotnet/tools
    # set -x SSH_AUTH_SOCK $HOME/.bitwarden-ssh-agent.sock

    # nvm use lts

    # aliases
    alias ll="ls -la"
end
