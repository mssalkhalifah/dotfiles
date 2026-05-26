function __nvm_symlinks_update --on-variable nvm_current_version --description 'Maintain ~/.local/bin symlinks for nvm-managed node so GNOME-launched apps (JetBrains IDEs) can find it on PATH'
    set -l nvm_root $HOME/.local/share/nvm
    set -l target_bin $HOME/.local/bin

    test -n "$nvm_current_version"; or return
    test -d "$nvm_root/$nvm_current_version/bin"; or return

    mkdir -p $target_bin

    for bin in node npm npx corepack
        set -l src $nvm_root/$nvm_current_version/bin/$bin
        test -e $src; or continue
        ln -sfn $src $target_bin/$bin
    end
end

__nvm_symlinks_update
