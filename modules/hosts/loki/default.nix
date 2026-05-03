{ config, ... }:
{
    nixosHosts.loki = {
        unstable = true;

        modules = [
            ./_nixos
        ]
        ++ (with config.flake.modules.nixos; [
            dev
            desktop
            bluetooth
            nvidia
        ]);
    };
}
