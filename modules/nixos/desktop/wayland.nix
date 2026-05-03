{
    flake.modules.nixos.desktop = {pkgs, ...}:
    {
        security.polkit.enable = true;

        fonts.packages = with pkgs; [
            noto-fonts
            nerd-fonts.jetbrains-mono
            monocraft
        ];

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
