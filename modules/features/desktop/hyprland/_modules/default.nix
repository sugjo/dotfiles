{
    imports = [
        ./binds.nix
        ./visual.nix
        ./rules.nix
        ./autostart.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
        settings = {
            monitor = [ ",preffered,auto,1" ];

            input = {
                kb_layout = "us, ru";
                kb_options = "grp:alt_shift_toggle";
            };

        };
    };
}
