{ config, ... }:
{
    nixosHosts.heimdall = {
        unstable = true;

        modules = [
            ./_nixos
        ]
        ++ (with config.flake.modules.nixos; [
            # substituters
            docker
            home-manager
            hyprland
            desktop
            cli
            noctalia-shell
            bluetooth
        ]);
    };
}
