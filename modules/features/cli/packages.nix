{
    flake.modules.nixos.cli = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            # Utils
            comma
            eza
        ];
    };
}
