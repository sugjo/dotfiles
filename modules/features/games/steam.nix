{
    flake.modules.nixos.steam = {
        programs.gamemode.enable = true;
        programs.steam = {
            enable = true;
        };
    };
}

