{
    flake.modules.nixos.desktop = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
            remmina
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
