{
  flake.modules.nixos.security = {
    security = {
      sudo = {
        enable = true;
        wheelNeedsPassword = false;
      };
    };
  };
}
