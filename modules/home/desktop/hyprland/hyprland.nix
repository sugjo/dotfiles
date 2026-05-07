{
    flake.modules.homeManager.hyprland = {
        imports = [
            ./_modules/binds.nix
            ./_modules/visual.nix
            ./_modules/rules.nix
        ];

        wayland.windowManager.hyprland = {
            enable = true;

            settings = {
                monitor = [ ",preffered,auto,1" ];

                input = {
                    kb_layout = "us, ru";
                    kb_options = "grp:alt_shift_toggle";
                };

                exec-once = [
                    "env NOCTALIA_CONFIG_DIR=$HOME/.config/noctalia NOCTALIA_SETTINGS_FILE=$HOME/.config/noctalia/settings.json noctalia-shell"
                ];
            };
        };
    };
}
