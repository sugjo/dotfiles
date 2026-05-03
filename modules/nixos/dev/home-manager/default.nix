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

            users.${primaryUser}.imports = [
                flakeArgs.config.flake.modules.homeManager.core
                {
                    home.homeDirectory = config.users.users.${primaryUser}.home;
                }
            ];

            extraSpecialArgs = {
                inherit (flakeArgs) inputs;
                inherit primaryUser;
                configName = "nixos_${hostName}";
                nhSwitchCommand = "nh os switch";
            };
        };
    };
}
