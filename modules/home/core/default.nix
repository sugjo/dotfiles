{
    flake.modules.homeManager.core =
    { primaryUser, ... }:
    {
        home = {
            username = primaryUser;
        };
    };
}
