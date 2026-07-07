{
    flake.modules.nixos.fish = {
        programs.fish.enable = true;
        hm = [{
            programs.fish = {
                enable = true;
                interactiveShellInit = ''
                    set -g fish_greeting "" 
                '';
            };
        }];
    };
}
