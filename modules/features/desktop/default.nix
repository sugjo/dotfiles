{ config, ... }:
{
    flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
        stylix
        kitty
        wayland
        fonts
        throne
        sound
        firefox
        display-manager
    ];
}
