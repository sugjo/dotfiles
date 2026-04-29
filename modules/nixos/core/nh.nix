{
    flake.modules.nixos.nh = { primaryUser, ... }:
    {
        programs.nh = {
            enable = true;

            flake = "/home/${primaryUser}/dotfiles";

            clean = {
                enable = true;

                dates = "05:00";
                extraArgs = "--keep 5 --keep-since 8d";
            };
        };
    };
}
