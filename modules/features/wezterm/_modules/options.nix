{ lib, ... }:
{
  options.wezterm = {
    settings = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
    };

    keys = lib.mkOption {
      type = lib.types.listOf lib.types.anything;
      default = [ ];
    };

    hooks = lib.mkOption {
      type = lib.types.lines;
      default = "";
    };
  };
}
