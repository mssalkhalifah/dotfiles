set -x SSH_AUTH_SOCK $HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x KUBECONFIG $HOME/.kube/config
    # set -x PATH $PATH:/opt/nvim-linux-x86_64/bin
    # set -x PATH $PATH:/home/mssalkhalifah/.dotnet/tools
    # set -x SSH_AUTH_SOCK $HOME/.bitwarden-ssh-agent.sock

    # nvm use lts

    # aliases
    alias ll="ls -la"
end

set fish_greeting ""

set -gx PATH $HOME/.dotnet/tools $PATH

if type -q /Applications/Tailscale.app/Contents/MacOS/Tailscale
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
end

if type -q nvm
    nvm use lts
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
