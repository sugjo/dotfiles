{
    flake.modules.nixos.desktop = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
            vesktop
            telegram-desktop
            mpv
            firefox
        ];
    };
}
