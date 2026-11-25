{ lib }:
let
  raw = lib.generators.mkLuaInline;
  toLua = lib.generators.toLua { };
in
{
  inherit raw toLua;

  act = name: args: raw "act.${name}(${toLua args})";
  callback = fn: raw "wezterm.action_callback(${fn})";

  reload = raw "act.ReloadConfiguration";
  splitH = raw "act.SplitHorizontal({ domain = 'CurrentPaneDomain' })";
  splitV = raw "act.SplitVertical({ domain = 'CurrentPaneDomain' })";
  spawnTab = raw "act.SpawnTab('CurrentPaneDomain')";
  closePane = raw "act.CloseCurrentPane({ confirm = true })";
  copyMode = raw "act.ActivateCopyMode";

  activatePane = dir: raw "act.ActivatePaneDirection('${dir}')";
  activateTab = index: raw "act.ActivateTab(${toString index})";
}
