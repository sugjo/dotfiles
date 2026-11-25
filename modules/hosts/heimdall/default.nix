{ config, ... }:
{
    nixosHosts.heimdall = {
        unstable = true;

        modules = [
            ./_nixos
        ]
        ++ (with config.flake.modules.nixos; [
            # substituters
            wezterm
            docker
            home-manager
            hyprland
            desktop
            cli
            yubikey
            noctalia-shell
            bluetooth
        ]);
    };
}
