{
    flake.modules.nixos.fonts = {pkgs, ...}: {
        fonts.packages = with pkgs; [
            noto-fonts
            nerd-fonts.jetbrains-mono
            monocraft
        ];
    };
}
