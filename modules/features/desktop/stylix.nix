{ inputs, ... }:
{
    flake.modules.nixos.stylix = { pkgs, ... }: {
            imports = [ inputs.stylix.nixosModules.stylix ];

            stylix = {
                enable = true;
                homeManagerIntegration = {
                    autoImport = true;
                    followSystem = true;
                };

                base16Scheme = {
                    base00 = "130f1a"; # Фон (стал глубже и темнее для контраста)
                    base01 = "3d1a28"; # Выбор в Nvim (темнее, чтобы текст на нем выделялся)
                    base02 = "6d2d48"; # Цвет выделения (более насыщенный, но темнее текста)
                    base03 = "9e6175"; # Комментарии (чуть приглушили яркость, чтобы не спорили с текстом)

                    base04 = "b399cc"; # Границы (стали четче)
                    base05 = "fbd5e1"; # Основной текст (оставили твой нежный розовый)
                    base06 = "ffffff"; # Яркий текст (чисто белый для контраста)
                    base07 = "ffffff"; 

                    # Акценты (сделали более сочными)
                    base08 = "ff5252"; # Ошибки (более чистый красный)
                    base09 = "ff7043"; # Константы (более яркий оранжевый)
                    base0A = "ffca28"; # Классы (чистый янтарный желтый)
                    base0B = "66bb6a"; # Строки (более выразительный зеленый)

                    base0C = "ce93d8"; # Спец. символы (насыщенный сиреневый)
                    base0D = "f06292"; # ТВОЙ АКЦЕНТ (без изменений, теперь сияет на темном фоне)
                    base0E = "ba68c8"; # Ключевые слова (тоже твой акцент для строгого стиля)
                    base0F = "a1887f"; # Второстепенное
                };

                image = ./wallpaper.jpg;

                polarity = "dark";
                opacity.desktop = 0.85;
                opacity.terminal = 0.85;

                cursor = {
                    package = pkgs.rose-pine-cursor;
                    name = "BreezeX-RosePine-Linux";
                    size = 34;
                };
            };
    };
}
