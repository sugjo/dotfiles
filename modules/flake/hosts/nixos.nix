{ inputs, lib, config, self, ... }:
let
    inherit (lib) types mkOption;
    inherit (import ./_utils { inherit lib inputs; }) baseHostModule;
in
{
    options = {
        nixosHosts =
        let
            hostType = types.submodule [
                baseHostModule
                ({ name, ... }: {
                    system = lib.mkDefault "x86_64-linux";
                    finalPackage = self.nixosConfigurations.${name}.config.system.build.toplevel;
                })
            ];
        in
        mkOption {
            type = types.attrsOf hostType;
            default = {};
        };
    };

    config = {
        flake.nixosConfigurations =
        let
            mkHost =
                hostname: options:
                options.nixpkgs.lib.nixosSystem {
                    inherit (options) system specialArgs;
                    modules = [
                        config.flake.modules.nixos.core
                        ({config, ... }: {
                            options.hm = mkOption {
                                type = with types; listOf deferredModule;
                                default = [];
                            };

                            config = {
                                networking.hostName = hostname;
                                home-manager.users.${options.primaryUser}.imports = config.hm;
                            };

                        })
                    ] ++ options.modules;
                };
        in
        lib.mapAttrs mkHost config.nixosHosts;
    };
}
