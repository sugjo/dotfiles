{
    flake.modules.nixos.fzf = {
        hm = [{
            programs.fzf = {
                enable = true;
                tmux.enableShellIntegration = true;
            };
        }];
    };
}
