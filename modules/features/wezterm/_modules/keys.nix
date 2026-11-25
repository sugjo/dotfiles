{ lib, ... }:
let
  dsp = import ./dsp.nix { inherit lib; };
in
{
  wezterm.keys = [
    { key = "r"; mods = "LEADER"; action = dsp.reload; }
    { key = "|"; mods = "LEADER|SHIFT"; action = dsp.splitH; }
    { key = "-"; mods = "LEADER"; action = dsp.splitV; }
    { key = "c"; mods = "LEADER"; action = dsp.spawnTab; }
    { key = "x"; mods = "LEADER"; action = dsp.closePane; }

    { key = "h"; mods = "LEADER"; action = dsp.activatePane "Left"; }
    { key = "j"; mods = "LEADER"; action = dsp.activatePane "Down"; }
    { key = "k"; mods = "LEADER"; action = dsp.activatePane "Up"; }
    { key = "l"; mods = "LEADER"; action = dsp.activatePane "Right"; }

    { key = "h"; mods = "ALT"; action = dsp.activatePane "Left"; }
    { key = "j"; mods = "ALT"; action = dsp.activatePane "Down"; }
    { key = "k"; mods = "ALT"; action = dsp.activatePane "Up"; }
    { key = "l"; mods = "ALT"; action = dsp.activatePane "Right"; }

    { key = "f"; mods = "LEADER"; action = dsp.callback "open_tv"; }
    { key = "f"; mods = "ALT"; action = dsp.callback "open_tv"; }
    { key = "s"; mods = "ALT"; action = dsp.callback "last_workspace"; }
    { key = "g"; mods = "LEADER"; action = dsp.callback "open_lazygit"; }
    { key = "g"; mods = "ALT"; action = dsp.callback "open_lazygit"; }
    { key = "o"; mods = "LEADER"; action = dsp.callback "open_opencode"; }
    { key = "o"; mods = "ALT"; action = dsp.callback "open_opencode"; }

    { key = "["; mods = "LEADER"; action = dsp.copyMode; }
  ] ++ lib.concatMap (index: [
    { key = toString index; mods = "ALT"; action = dsp.activateTab (index - 1); }
    { key = toString index; mods = "LEADER"; action = dsp.activateTab (index - 1); }
  ]) (lib.range 1 9);
}
