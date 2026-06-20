let
    bezier = name: x1: y1: x2: y2: { _args = [ name { type = "bezier"; points = [ [ x1 y1 ] [ x2 y2 ] ]; } ]; };
    anim = leaf: speed: bezier: style: { inherit leaf speed bezier; enabled = true; inherit style; };
    animSimple = leaf: speed: bezier: { inherit leaf speed bezier; enabled = true; };
in
{
    wayland.windowManager.hyprland.settings = {
        config = {
            animations.enabled = true;

            general = {
                gaps_in = 4;
                gaps_out = 8;
                border_size = 2;
                layout = "dwindle";
                allow_tearing = false;
            };

            decoration = {
                rounding = 0;
                blur = {
                    enabled = true;
                    size = 3;
                    passes = 3;
                    vibrancy = 0.1696;
                };
            };

            dwindle = {
              preserve_split = true;
            };

            misc = {
              force_default_wallpaper = 0;
              disable_hyprland_logo = true;
            };
        };

        layer_rule = [
            { 
                match.namespace = "^noctalia-.*$";
                blur = true;
                ignore_alpha = 0.2;
                blur_popups = true;
                xray = false;
            }
        ];

        window_rule = [
            { 
                match = {
                    float = false;
                    workspace = "w[tv1]";
                };
                border_size = 0;
            }
            { 
                match = {
                    float = false;
                    workspace = "f[1]";
                };
                border_size = 1;
            }
        ];

        workspace_rule = [
            {
                workspace = "w[tv1]";
                gaps_out = 0;
                gaps_in = 0;

            }
            {
                workspace = "f[1]";
                gaps_out = 0;
                gaps_in = 0;

            }
        ];


        curve = [
            (bezier "easeOutQuint" 0.23 1 0.32 1)
            (bezier "easeInOutCubic" 0.65 0.05 0.36 1)
            (bezier "linear" 0 0 1 1)
            (bezier "almostLinear" 0.5 0.5 0.75 1.0)
            (bezier "quick" 0.15 0 0.1 1)
        ];

        animation = [
            (animSimple "global" 10 "default")
            (animSimple "border" 5.39 "easeOutQuint")
            (animSimple "windows" 4.79 "easeOutQuint")
            
            (anim "windowsIn" 4.1 "easeOutQuint" "popin 87%")
            (anim "windowsOut" 1.49 "linear" "popin 87%")
            
            (animSimple "fadeIn" 1.73 "almostLinear")
            (animSimple "fadeOut" 1.46 "almostLinear")
            (animSimple "fade" 3.03 "quick")
            (animSimple "layers" 3.81 "easeOutQuint")
            
            (anim "layersIn" 4 "easeOutQuint" "fade")
            (anim "layersOut" 1.5 "linear" "fade")
            
            (animSimple "fadeLayersIn" 1.79 "almostLinear")
            (animSimple "fadeLayersOut" 1.39 "almostLinear")
            
            (anim "workspaces" 1.94 "almostLinear" "fade")
            (anim "workspacesIn" 1.21 "almostLinear" "fade")
            (anim "workspacesOut" 1.94 "almostLinear" "fade")
        ];
    };
}

