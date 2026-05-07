{ config, ... }:
{
    nixosHosts.loki = {
        unstable = true;

        modules = [
            ./_nixos
        ]
        ++ (with config.flake.modules.nixos; [
            dev
            games
            desktop
            hyprland
            bluetooth
            nvidia
        ]);

        homeManagerModules = [
        ]
        ++ (with config.flake.modules.homeManager; [
            desktop
        ]);
    };
}
