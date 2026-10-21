{
    flake.modules.nixos.desktop = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
            remmina
            google-chrome
            hyprpaper
            hyprpwcenter
            pavucontrol
            discord
            telegram-desktop
            mpv
            super-productivity
        ];
    };
}
