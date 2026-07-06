{
    imports = [
        ./binds.nix
        ./visual.nix
    #     ./rules.nix
        ./autostart.nix
        ./packages.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        configType = "lua";
        systemd.enable = true;

        settings = {
          config = {
            # general = {
            #   gaps_in = 5;
            #   gaps_out = 5;
            #   border_size = 1;
            #   col = {
            #     active_border = "rgb(e1e1e1)";
            #     inactive_border = "rgb(151515)";
            #   };
            # };

            # decoration = {
            #   rounding = 5;
            #   active_opacity = 1.0;
            #   inactive_opacity = 1.0;
            #   blur = {
            #     enabled = true;
            #     size = 3;
            #     passes = 1;
            #     vibrancy = 0.1696;
            #   };
            # };

            # animations = {
            #   enabled = true;
            # };
            #
            # dwindle = {
            #   force_split = 2;
            #   preserve_split = true;
            # };
            #
            # misc = {
              # force_default_wallpaper = -1;
              # disable_hyprland_logo = true;
            # };

                input = {
                    kb_layout = "us, ru";
                    kb_options = "grp:alt_shift_toggle";
                    follow_mouse = 1;
                    sensitivity = 0;
                };
            };
        };
    };
}
