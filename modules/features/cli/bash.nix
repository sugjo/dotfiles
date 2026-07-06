{
    flake.modules.nixos.bash = { pkgs, ... }: {
        programs.bash.completion.enable = true;
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
