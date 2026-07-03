{
    flake.modules.nixos.bash = {
        hm = [{
            programs.bash = {
                enable = true;
            };
        }];
    };
}
