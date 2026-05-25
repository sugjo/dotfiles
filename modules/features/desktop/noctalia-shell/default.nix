{ inputs, ... }:
{
    flake.modules.nixos.noctalia-shell = { primaryUser, ... }: {
        hm = [
            ./_modules/bar.nix
            ./_modules/app-launcher.nix
            {
                imports = [
                    inputs.noctalia.homeModules.default
                ];

                programs.noctalia-shell = {
                    enable = true;

                    settings = {
                        settingsVersion = 59;
                        dock = {
                            enabled = false;
                        };

                        wallpaper = {
                            enabled = false;
                        };

                        general = {
                            enableShadows = false;
                        };
                    };
                };
            }
        ];
    };
}
