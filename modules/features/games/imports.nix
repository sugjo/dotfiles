{ config, ... }:
{
    flake.modules.nixos.games.imports = with config.flake.modules.nixos; [
        steam
        prismlauncher
    ];
}
