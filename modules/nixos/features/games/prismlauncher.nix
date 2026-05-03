{
    flake.modules.nixos.prismlauncher = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
            prismlauncher
        ];
    };
}
