{
    flake.modules.nixos.nix = { primaryUser, ... }:
    {
        nixpkgs.config = {
            allowUnfree = true;
        };

        nix = {
            settings = {
                experimental-features = "nix-command flakes";

                max-jobs = "auto";

                use-xdg-base-directories = true;

                http-connections = 128;

                max-substitution-jobs = 128;

                min-free = 128000000; # 128 MB
                max-free = 1000000000; # 1 GB

                keep-outputs = true;
                keep-derivations = true;

                auto-optimise-store = true;

                warn-dirty = false;

                connect-timeout = 5;

                trusted-users = [
                    "root"
                    "@wheel"
                    primaryUser
                ];

                builders-use-substitutes = true;

                fallback = true;
            };
        };
    };
}
