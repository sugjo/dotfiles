{ lib, osConfig, ... }:
let
    dsp = import ./dsp.nix { inherit lib; };

    run = cmd: "hl.exec_cmd(\"${cmd}\")";
    runAt = ws: cmd: "hl.exec_cmd(\"${cmd}\", { workspace = \"${toString ws}\" })";
    runDsp = dsp: "hl.dispatch(${dsp.expr})";
    rule = class: ws: { 
        match.class = class;
        workspace = toString ws; 
        no_initial_focus = true;
        suppress_event = "activate activatefocus";
    };
in
{
  wayland.windowManager.hyprland.settings = {
    on = {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''
          function()
            ${runAt 1 "${osConfig.desktop.terminal.run} sesh connect ."}
            ${runAt 3 "${osConfig.desktop.browser}"}
            ${runAt 10 "Throne"}

            ${run "Telegram"}
            ${run "discord --enable-features=UseOzonePlatform --ozone-platform=wayland"}

            ${run "noctalia"}
            ${run "hyprpaper"}
            ${runDsp (dsp.focusWorkspace 3)}
          end
        '')
      ];
    };

    window_rule = [
        (rule "^([Dd]iscord)$" "4 silent")
        (rule "^(org.telegram.desktop)$" "4 silent")
        (rule "^(Throne)$" "10 silent")
        (rule "^(${osConfig.desktop.browser})$" "3 silent")
    ];
  };
}
