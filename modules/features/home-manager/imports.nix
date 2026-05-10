{ config, ... }:
{
    flake.modules.nixos.core.imports = with config.flake.modules.nixos; [
        home-manager
        xdg
    ];
}
