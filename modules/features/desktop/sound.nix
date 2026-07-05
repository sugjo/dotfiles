{
    flake.modules.nixos.sound = {
        services.pipewire = {
            enable = true;
            pulse.enable = true;
        };
        programs.dconf.enable = true;
        hm = [{
            services.easyeffects.enable = true;
        }];
    };
}
