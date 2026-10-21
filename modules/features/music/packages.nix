{
    flake.modules.nixos.music = { pkgs, ...}:
    {
        environment.systemPackages = with pkgs; [
            bitwig-studio6
            lsp-plugins
            vital
            guitarix
            guitarix-vst
            fretboard
        ];
    };
}
