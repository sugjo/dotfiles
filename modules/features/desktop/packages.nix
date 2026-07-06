{
    flake.modules.nixos.desktop = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
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
