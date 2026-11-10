{ config, ... }:
{
    nixosHosts.rkpz = {
        unstable = false;

        modules = [
            ./_nixos
        ];
       # ++ (with config.flake.modules.nixos; [
        #
        # ]);
    };
}
