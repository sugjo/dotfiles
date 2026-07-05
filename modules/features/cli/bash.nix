{
    flake.modules.nixos.bash = { pkgs, ... }: {
        hm = [{
            programs.bash = {
                enable = true;
            };
            home.packages = [
                pkgs.devenv
            ];
        }];
    };
}
