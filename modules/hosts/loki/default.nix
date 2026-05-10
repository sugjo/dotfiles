{ config, ... }:
{
    nixosHosts.loki = {
        unstable = true;

        modules = [
            ./_nixos
        ]
        ++ (with config.flake.modules.nixos; [
            substituters
            home-manager
            desktop
            hyprland
            noctalia-shell
            games
            bluetooth
            nvidia
            torrserver
        ]);
    };
}
