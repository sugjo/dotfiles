{ lib, inputs, ... }:
{
    flake.modules.nixos.noctalia-shell = { config, ... }: {
        desktop.launcher = lib.mkDefault "noctalia msg panel-toggle launcher";
        desktop.lockscreen = lib.mkDefault "noctalia msg session lock";

        hm = [
            # ./_modules/bar.nix
            # ./_modules/app-launcher.nix
            ./_modules/visual.nix
            {
                imports = [
                    inputs.noctalia.homeModules.default
                ];

                programs.noctalia = {
                    enable = true;

                    settings = {
                        bar.default = {
                            start = [ "workspaces" ];
                            center = ["clock"];
                            end = [
                              "tray"
                              "keyboard_layout"
                              "network"
                              "volume"
                              "battery"
                              "notifications"
                            ];
                            margin_edge = 0;
                            margin_ends = 0;
                            padding = 6;
                            radius = 0;
                            shadow = false;
                            background_opacity = config.stylix.opacity.desktop;
                            widget_spacing = 12;
                        };
                        theme = {
                            source = "custom";
                            custom_palette = "stylix";
                            mode = config.stylix.polarity;
                        };
                        dock = {
                            enabled = false;
                        };
                        wallpaper = {
                            enabled = false;
                        };
                        lockscreen = {
                            wallpaper = ../wallpaper.jpg;
                        };
                    };
                };
            }
        ];
    };
}
