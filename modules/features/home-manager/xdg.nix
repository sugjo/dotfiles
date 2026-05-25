{
    flake.modules.nixos.xdg = { pkgs, ... }:
    {
        hm = [{
            home = {
                packages = [ pkgs.xdg-utils ];

                preferXdgDirectories = true;
            };

            xdg = {
                enable = true;
                userDirs = {
                    enable = true;
                    createDirectories = true;
                    setSessionVariables = true; 
                };
            };
        }];
    };
}
