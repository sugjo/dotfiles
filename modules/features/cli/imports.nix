{ config, ... }:
{
    flake.modules.nixos.cli.imports = with config.flake.modules.nixos; [
        nvim
        tmux
        bash
        television
    ];
}

