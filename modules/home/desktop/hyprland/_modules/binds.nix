{ lib, ... }:
{
        wayland.windowManager.hyprland.settings = {
            "$mod" = "SUPER";

            bind = [
                "$mod, Q, exec, kitty"
                "$mod, C, killactive"
                "$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"

                "$mod, V, togglefloating"
                "$mod, R, exec, noctalia-shell ipc call launcher toggle"
                "$mod, F, fullscreen, 1"
                "$mod SHIFT, F, fullscreen"

                "$mod, H, movefocus, l"
                "$mod, L, movefocus, r"
                "$mod, K, movefocus, u"
                "$mod, J, movefocus, d"

                "$mod SHIFT, H, movewindow, l"
                "$mod SHIFT, L, movewindow, r"
                "$mod SHIFT, K, movewindow, u"
                "$mod SHIFT, J, movewindow, d"

                "$mod, escape, exec, noctalia-shell ipc call sessionMenu toggle"
            ]
            ++ (builtins.concatMap (i: [
                "$mod, code:1${toString i}, workspace, ${toString (i+1)}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString (i + 1)}"
            ]) (lib.range 0 9));

            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];
        };
}
