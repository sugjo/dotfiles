{ config, lib, ... }:
let
  toLua = lib.generators.toLua { };
  settings = lib.concatStringsSep "\n"
    (lib.mapAttrsToList (name: value: "config.${name} = ${toLua value};") config.wezterm.settings);
in
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action
      local config = wezterm.config_builder and wezterm.config_builder() or {}

      ${config.wezterm.hooks}

      ${settings}

      config.keys = ${toLua config.wezterm.keys};

      return config
    '';
  };
}
