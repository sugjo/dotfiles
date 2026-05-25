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
            hyprland
            desktop
            cli
            noctalia-shell
            games
            bluetooth
            nvidia
            torrserver
        ]);
    };
}
