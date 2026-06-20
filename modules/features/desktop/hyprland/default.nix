{
    flake.modules.nixos.hyprland = {pkgs, ...}:
    {
        desktop.wm = "start-hyprland";

        programs.hyprland = {
            enable = true;
            xwayland.enable = true;
        };

        environment.sessionVariables = {
            NIXOS_OZONE_WL = "1";
        };

        xdg.portal = {
            extraPortals = with pkgs; [
                xdg-desktop-portal-hyprland
            ];

            config.hyprland.default = [ "hyprland" "gtk" ];
        };

        hm = [
            ./_modules
        ];
    };
}
