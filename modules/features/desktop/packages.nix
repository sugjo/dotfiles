{
    flake.modules.nixos.desktop = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
            hyprpaper
            vesktop
            telegram-desktop
            mpv
            super-productivity
        ];
    };
}
