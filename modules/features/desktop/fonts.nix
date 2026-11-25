{
    flake.modules.nixos.fonts = {pkgs, ...}: {
        fonts.packages = with pkgs; [
            nerd-fonts.geist-mono
            noto-fonts
            nerd-fonts.jetbrains-mono
            monocraft
        ];
    };
}
