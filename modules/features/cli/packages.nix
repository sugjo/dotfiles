{
    flake.modules.nixos.cli = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            # Utils
            nix-index
            lazygit
            comma
            eza
        ];
    };
}
