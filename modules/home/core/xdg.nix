{
    flake.modules.homeManager.xdg = { pkgs, ... }:
    {
        home = {
            packages = [ pkgs.xdg-utils ];

            preferXdgDirectories = true;
        };

        xdg = {
            userDirs = {
                enable = true;
                createDirectories = true;
            };
        };
    };
}
