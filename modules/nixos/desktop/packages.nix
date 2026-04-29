{
    flake.modules.nixos.desktop = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
            vesktop
            mpv
            firefox
        ];
    };
}
