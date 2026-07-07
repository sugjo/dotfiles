{ config, ... }:
{
    flake.modules.nixos.cli.imports = with config.flake.modules.nixos; [
        zoxide
        nvim
        tmux
        sesh
        fish
        television
    ];
}

