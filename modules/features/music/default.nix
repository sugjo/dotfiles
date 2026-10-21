{ config, ... }:
{
    flake.modules.nixos.music.imports = with config.flake.modules.nixos; [
    ];
}
