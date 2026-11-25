{ config, ... }:
let
  flakeConfig = config;
  channel = "wezterm";
  choiceFile = "/tmp/wezterm-tv-choice";
in
{
  flake.modules.nixos.wezterm =
    { config, pkgs, lib, ... }:
    {
      imports = [ flakeConfig.flake.modules.nixos.television ];

      desktop.terminal.bin = lib.mkForce "${pkgs.wezterm}/bin/wezterm";
      desktop.terminal.run = lib.mkForce "${pkgs.wezterm}/bin/wezterm cli spawn --";

      hm = [
        ./_modules/options.nix
        ./_modules/settings.nix
        ./_modules/session.nix
        ./_modules/keys.nix
        (import ./_modules/hooks.nix {
          inherit channel choiceFile;
          colors = config.lib.stylix.colors.withHashtag;
        })
        ./_modules/render.nix
        (import ./_modules/television.nix { inherit channel choiceFile; })
      ];
    };
}
