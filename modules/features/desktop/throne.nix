{
    flake.modules.nixos.throne = {
        programs.throne = {
            enable = true;
            tunMode.enable = true;
        };
    };
}
