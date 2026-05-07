{ inputs, ... }:
{
    flake.modules.homeManager.noctalia-shell = { primaryUser, ... }: {
        imports = [
            inputs.noctalia.homeModules.default
            ./_modules/bar.nix
            ./_modules/app-launcher.nix
        ];

        programs.noctalia-shell = {
            enable = true;

            # colors = {
            #     mError = "#dddddd";
            #     mOnError = "#111111";
            #     mOnPrimary = "#111111"; # цвет текста на кнопках
            #     mOnSecondary = "#111111";
            #     mOnSurface = "#FFFFFFFF"; # цвет текста на поверхности
            #     mOnSurfaceVariant = "#5d5d5d";
            #     mOnTertiary = "#111111";
            #     mOnHover = "#ffffff";
            #     mOutline = "#3c3c3c";
            #     mPrimary = "#FFF06292"; # цвет интерфйеса
            #     mSecondary = "#FF9A4367";
            #     mShadow = "#000000";
            #     mSurface = "#D8181423"; # цвет поверхностей
            #     mHover = "#1f1f1f";
            #     mSurfaceVariant = "#191919";
            #     mTertiary = "#cccccc";
            # };

            settings = {
                settingsVersion = 59;
                dock = {
                    enabled = false;
                };

                wallpaper = {
                    enabled = true;
                    directory = "/home/${primaryUser}/Pictures/wallpaper";
                };

                general = {
                    enableShadows = false;
                };
            };
        };
    };
}
