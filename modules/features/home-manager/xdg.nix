{
    flake.modules.nixos.xdg = { pkgs, ... }:
    {
        hm = [{
            home = {
                packages = [ pkgs.xdg-utils ];

                preferXdgDirectories = true;
            };

            xdg = {
                userDirs = {
                    enable = true;
                    createDirectories = true;
                    setSessionVariables = true; 
                };
            };
        }];
    };
}
