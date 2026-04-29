{ config, ... }:
{
    nixosHosts.loki = {
        unstable = true;

        modules = [
            ./_nixos
        ]
        ++ (with config.flake.modules.nixos; [
            desktop
            substituters
            bluetooth
            nvidia
        ]);
    };
}
