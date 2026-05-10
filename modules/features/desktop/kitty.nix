{
    flake.modules.nixos.kitty = { ... }: {
        hm = [{
            programs.kitty.enable = true;
        }];
    };
}
