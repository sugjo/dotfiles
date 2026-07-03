{
    flake.modules.nixos.television= { pkgs, ... }: {
        hm = [{
            programs.television = {
                enable = true;
            };
            home.packages = with pkgs; [
                fd
                tmux
            ];
        }];
    };
}
