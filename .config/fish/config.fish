for sock in $HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock \
            $HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
    if test -S $sock
        set -gx SSH_AUTH_SOCK $sock
        break
    end
end

if status is-interactive
    set -gx KUBECONFIG $HOME/.kube/config
    alias ll="ls -la"
end

set fish_greeting ""

for candidate in $HOME/.dotnet /usr/local/share/dotnet /usr/share/dotnet /opt/dotnet
    if test -d $candidate/shared/Microsoft.NETCore.App
        set -gx DOTNET_ROOT $candidate
        break
    end
end

set -gx PATH $DOTNET_ROOT $HOME/.dotnet/tools $PATH
set -gx PATH $HOME/.dotfiles $PATH

if type -q /Applications/Tailscale.app/Contents/MacOS/Tailscale
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
end

if type -q nvm
    nvm use lts >/dev/null 2>&1
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
