{
    flake.modules.nixos.desktop = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
            hyprpaper
            discord
            telegram-desktop
            mpv
            super-productivity
        ];
    };
}
