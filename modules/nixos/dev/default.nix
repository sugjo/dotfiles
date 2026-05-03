flakeArgs: {
    flake.modules.nixos.dev = { ... }:
    {
        imports = with flakeArgs.config.flake.modules.nixos; [
            home-manager
            substituters
        ];
    };
}
