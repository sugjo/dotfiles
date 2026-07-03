{
    flake.modules.nixos.docker = { primaryUser, ... }:
    {
        virtualisation.docker = {
            enable = true;
            autoPrune = {
                enable = true;
                dates = "weekly";
                flags = [ "--all" "--volumes" ];
            };
        };
        users.users.${primaryUser}.extraGroups = [ "docker" ]; 
    };
}
