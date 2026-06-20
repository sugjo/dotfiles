{ lib, osConfig, ... }:
let
    dsp = import ./dsp.nix { inherit lib; };

    bind = keys: dispatcher: { _args = [keys dispatcher]; };
    bindOpts = keys: dispatcher: opts: { _args = [keys dispatcher opts]; };

    workspaceBinds = lib.concatMap (i:
        let key = toString (lib.mod i 10);
        in [
            (bind "SUPER + ${key}" (dsp.focusWorkspace i))
            (bind "SUPER + SHIFT + ${key}" (dsp.moveToWorkspace i))
        ]
    ) (lib.range 1 10);
in
{
    wayland.windowManager.hyprland = {
        settings = {
          bind = [
            (bind "SUPER + Q" (dsp.exec "kitty"))
            (bind "SUPER + R" (dsp.exec "${osConfig.desktop.launcher}"))

            # Window management
            (bind "SUPER + C" dsp.close)
            (bind "SUPER + M" dsp.exit)
            (bind "SUPER + V" dsp.float)
            (bind "SUPER + F" dsp.maximize)
            (bind "SUPER + SHIFT + F" dsp.fullscreen)

            # Focus
            (bind "SUPER + H" (dsp.focus "left"))
            (bind "SUPER + L" (dsp.focus "right"))
            (bind "SUPER + K" (dsp.focus "up"))
            (bind "SUPER + J" (dsp.focus "down"))

            # Swap windows
            (bind "SUPER + SHIFT + H" (dsp.swap "left"))
            (bind "SUPER + SHIFT + L" (dsp.swap "right"))
            (bind "SUPER + SHIFT + K" (dsp.swap "up"))
            (bind "SUPER + SHIFT + J" (dsp.swap "down"))

            # Special workspace
            (bind "SUPER + S" (dsp.toggleSpecial "magic"))
            (bind "SUPER + SHIFT + S" (dsp.moveToSpecial "magic"))

            # Scroll through workspaces
            (bind "SUPER + mouse_down" (dsp.focusWorkspace "e+1"))
            (bind "SUPER + mouse_up" (dsp.focusWorkspace "e-1"))

            # Volume keys
            (bindOpts "XF86AudioRaiseVolume" (dsp.exec "wpctl set-volume @ 5%+") { locked = true; repeating = true; })
            (bindOpts "XF86AudioLowerVolume" (dsp.exec "wpctl set-volume @ 5%-") { locked = true; repeating = true; })
            (bindOpts "XF86AudioMute" (dsp.exec "wpctl set-mute @ toggle") { locked = true; })
            (bindOpts "XF86AudioMicMute" (dsp.exec "wpctl set-mute u/DEFAULT_AUDIO_SOURCE@ toggle") { locked = true; })

            # Mouse move/resize
            (bindOpts "SUPER + mouse:272" dsp.drag { mouse = true; })
            (bindOpts "SUPER + mouse:273" dsp.resize { mouse = true; })
          ] ++ workspaceBinds;
        };
    };
}
