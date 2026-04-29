{
    flake.modules.nixos.desktop = {pkgs, primaryUser, ...}:
    {
        security.polkit.enable = true;

        programs.hyprland = {
            enable = true;
            xwayland.enable = true;
        };

        fonts.packages = with pkgs; [
            noto-fonts
            nerd-fonts.jetbrains-mono
        ];

        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        xdg.portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-wlr
                xdg-desktop-portal-gtk
            ];
        };
    };
}
