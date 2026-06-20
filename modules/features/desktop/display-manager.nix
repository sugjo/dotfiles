{
  flake.modules.nixos.display-manager =
    { pkgs, config, ... }:
    {
        services.greetd = {
          enable = true;
          settings = {
            default_session = {
              command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${config.desktop.wm}";
              user = "greeter";
            };
          };
        };
    };
}
