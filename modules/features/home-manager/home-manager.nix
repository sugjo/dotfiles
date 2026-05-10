flakeArgs: {
    flake.modules.nixos.home-manager = { config, primaryUser, ... }:
    let
        inherit (config.networking) hostName;
    in
    {
        imports = [
            flakeArgs.inputs.home-manager.nixosModules.home-manager
        ];

        home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = {
                inherit (flakeArgs) inputs;
                inherit primaryUser;
                configName = "nixos_${hostName}";
            };
        };

        hm = [{
            home = {
                homeDirectory = config.users.users.${primaryUser}.home;
                stateVersion = "25.11";
                username = primaryUser;
            };

            programs.home-manager.enable = true;
        }];
    };
}
