{
    flake.modules.nixos.firefox = { lib, primaryUser, ... }: {
        desktop.browser = lib.mkDefault "firefox";

        hm = [{
            programs.firefox = {
                enable = true;
                profiles = {
                    ${primaryUser} = {
                        id = 0;
                        isDefault = true;
                        name = "${primaryUser}";
                        path = "${primaryUser}";
                        extensions.force = true;
                        settings = {
                            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                            "extensions.autoDisableScopes" = 0;
                        };
                    };
                };
        	};

            stylix.targets.firefox = {
                colorTheme.enable = true;
                colors.enable = true;
                enable = true;
                profileNames = [ "${primaryUser}" ]; 
            };
        }];
    };
}
