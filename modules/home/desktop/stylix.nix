{ inputs, ... }:
{
    flake.modules.homeManager.stylix = { pkgs, ... }: {
        imports = [ inputs.stylix.homeModules.stylix ];

        stylix = {
            enable = true;

            base16Scheme = {
                # === ФОН И ПОВЕРХНОСТИ ===
                base00 = "181423"; # mSurface — Ваш основной глубокий фон
                base01 = "1e1a2b"; # mSurfaceVariant — Вторичный фон (чуть светлее и в тон base00)
                base02 = "2d243a"; # mHover — Цвет выделения (фиолетовый оттенок вместо серого)
                base03 = "6a5a7c"; # mOnSurfaceVariant — Комментарии в NeoVim (читаемый лавандовый)

                # === ТЕКСТ И ИНТЕРФЕЙС ===
                base04 = "4c3d5c"; # mOutline — Границы и разделители (приглушенный фиолетовый)
                base05 = "ffffff"; # mOnSurface — Основной белый текст
                base06 = "f3eef8"; # mOnHover / mTertiary — Мягкий светлый акцент (кремово-белый)
                base07 = "181423"; # mOnPrimary — Цвет текста на кнопках (совпадает с фоном для контраста)

                # === АКЦЕНТЫ И ЦВЕТА (Без изменений по вашей просьбе) ===
                base08 = "F06292"; # mPrimary (Розовый)
                base09 = "9A4367"; # mSecondary (Вторичный)
                base0A = "cccccc"; # mTertiary
                base0B = "F06292"; # Копия mPrimary
                base0C = "9A4367"; # Копия mSecondary
                base0D = "F06292"; # Копия mPrimary
                base0E = "9A4367"; # Копия mSecondary
                base0F = "111111"; # mOnError

                # # === ФОН И ПОВЕРХНОСТИ ===
                # base00 = "181423"; # mSurface (Ваш основной фон)
                # base01 = "191919"; # mSurfaceVariant (Вторичный фон)
                # base02 = "1f1f1f"; # mHover (Цвет при наведении)
                # base03 = "5d5d5d"; # mOnSurfaceVariant (Приглушенный текст)
                #
                # # === ТЕКСТ И ИНТЕРФЕЙС ===
                # base04 = "3c3c3c"; # mOutline (Границы и разделители)
                # base05 = "ffffff"; # mOnSurface (Основной белый текст)
                # base06 = "dddddd"; # mError / mTertiary (Светлый акцент)
                # base07 = "111111"; # mOnPrimary (Цвет текста на кнопках)
                #
                # # === АКЦЕНТЫ И ЦВЕТА ===
                # base08 = "F06292"; # mPrimary (Главный цвет интерфейса - Розовый)
                # base09 = "9A4367"; # mSecondary (Вторичный цвет)
                # base0A = "cccccc"; # mTertiary (Третичный акцент)
                # base0B = "F06292"; # Копия mPrimary
                # base0C = "9A4367"; # Копия mSecondary
                # base0D = "F06292"; # Копия mPrimary
                # base0E = "9A4367"; # Копия mSecondary
                # base0F = "111111"; # mOnError
            };

            image = ./wallpaper.jpg;

            polarity = "dark";
            opacity.desktop = 0.85;
            opacity.terminal = 0.85;

            cursor = {
                package = pkgs.afterglow-cursors-recolored;
                name = "Afterglow-Catppuccin-Red-v2";
                size = 24;
            };
        };
    };
}
