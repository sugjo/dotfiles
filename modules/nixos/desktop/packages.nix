{
    flake.modules.nixos.desktop = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
            kitty
            vesktop
            telegram-desktop
            mpv
            firefox
        ];
    };
}
