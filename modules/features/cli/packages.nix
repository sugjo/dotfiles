{
    flake.modules.nixos.cli = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            # Utils
            devenv
            nix-index
            lazygit
            comma
            eza
        ];
    };
}
