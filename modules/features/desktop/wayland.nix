{
    flake.modules.nixos.wayland = {pkgs, ...}:
    {
        security.polkit.enable = true;

        environment.sessionVariables = {
            NIXOS_OZONE_WL = "1";
        };

        xdg.portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-gtk
            ];

            config.common.default = [ "gtk" ];
        };
    };
}
