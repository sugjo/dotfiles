{ lib, ... }:
let
    inherit (lib) mkOption types;
in
{
    flake.modules.nixos.desktop = {
        options.desktop = {
            terminal = {
                bin = mkOption { 
                    type = types.str;
                    example = "kitty";
                };
                run = mkOption { 
                    type = types.str;
                    example = "kitty -e";
                };
            };
            bar = mkOption {
                type = types.str;
                example = "waybar";
            };
            launcher = mkOption {
                type = types.str;
                example = "rofi";
            };
            lockscreen = mkOption {
                type = types.str;
            };
            screenshot = mkOption {
                type = types.str;
                example = "hyprshot -m output";
            };
            browser = mkOption {
                type = types.str;
                example = "firefox";
            };
            wm = mkOption {
                type = types.str;
                example = "sway";
            };
        };
    };
}
