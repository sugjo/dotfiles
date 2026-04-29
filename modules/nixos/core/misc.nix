{
    flake.modules.nixos.core = {
        time.timeZone = "Asia/Yekaterinburg";

        i18n.defaultLocale = "en_US.UTF-8";
        console = {
          # font = "Lat2-Terminus16";
          keyMap = "us";
        };

        services.fwupd.enable = true;

        networking = {
            networkmanager.enable = true;
            firewall.enable = false;

        };
    };
}
