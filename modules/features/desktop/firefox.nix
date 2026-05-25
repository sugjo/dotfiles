{
    flake.modules.nixos.firefox = { lib, ... }: {
        desktop.browser = lib.mkDefault "firefox";

        hm = [{
            programs.firefox = {
                enable = true;
                profiles.sugjo = {
                        id = 0;
                        isDefault = true;
                        name = "sugjo";
                        extensions.force = true;
                        settings = {
                            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                            "extensions.autoDisableScopes" = 0;
                        };
                    };
        	};

            stylix.targets.firefox = {
                colorTheme.enable = true;
                    enable = true;
                    profileNames = [ "sugjo" ]; 
                };
        }];
    };
}
