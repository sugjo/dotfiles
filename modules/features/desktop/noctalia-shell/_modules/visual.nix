{config, ...}: {
  xdg.configFile."noctalia/palettes/stylix.json".text = builtins.toJSON {
    dark = {
      mPrimary           = "#${config.lib.stylix.colors.base0D}"; # Зеленый/Акцент
      mOnPrimary         = "#${config.lib.stylix.colors.base00}"; # Темный текст на акценте
      mSecondary         = "#${config.lib.stylix.colors.base0C}"; # Голубой
      mOnSecondary       = "#${config.lib.stylix.colors.base00}";
      mTertiary          = "#${config.lib.stylix.colors.base08}"; # Розовый/Красный
      mOnTertiary        = "#${config.lib.stylix.colors.base00}";
      mError             = "#${config.lib.stylix.colors.base08}";
      mOnError           = "#${config.lib.stylix.colors.base00}";
      mSurface           = "#${config.lib.stylix.colors.base00}"; # Главный фон (272822)
      mOnSurface         = "#${config.lib.stylix.colors.base05}"; # Светлый текст (f8f8f2)
      mSurfaceVariant    = "#${config.lib.stylix.colors.base01}"; # Виджеты (3e3d32)
      mOnSurfaceVariant  = "#${config.lib.stylix.colors.base0D}"; # Подсветка в виджетах
      mOutline           = "#${config.lib.stylix.colors.base03}"; # Границы (75715e)
      mShadow            = "#${config.lib.stylix.colors.base00}";
      mHover             = "#${config.lib.stylix.colors.base02}";
      mOnHover           = "#${config.lib.stylix.colors.base05}";

      terminal = {
        background       = "#${config.lib.stylix.colors.base00}";
        foreground       = "#${config.lib.stylix.colors.base05}";
        cursor           = "#${config.lib.stylix.colors.base05}";
        cursorText       = "#${config.lib.stylix.colors.base00}";
        selectionBg      = "#${config.lib.stylix.colors.base05}";
        selectionFg      = "#${config.lib.stylix.colors.base00}";
        normal = {
          black          = "#${config.lib.stylix.colors.base00}";
          red            = "#${config.lib.stylix.colors.base08}";
          green          = "#${config.lib.stylix.colors.base0B}";
          yellow         = "#${config.lib.stylix.colors.base0A}";
          blue           = "#${config.lib.stylix.colors.base0D}";
          magenta        = "#${config.lib.stylix.colors.base0E}";
          cyan           = "#${config.lib.stylix.colors.base0C}";
          white          = "#${config.lib.stylix.colors.base05}";
        };
        bright = {
          black          = "#${config.lib.stylix.colors.base03}";
          red            = "#${config.lib.stylix.colors.base08}";
          green          = "#${config.lib.stylix.colors.base0B}";
          yellow         = "#${config.lib.stylix.colors.base0A}";
          blue           = "#${config.lib.stylix.colors.base0D}";
          magenta        = "#${config.lib.stylix.colors.base0E}";
          cyan           = "#${config.lib.stylix.colors.base0C}";
          white          = "#${config.lib.stylix.colors.base07}";
        };
      };
    };
  };                

  stylix.targets.noctalia-shell.enable = false;
}
