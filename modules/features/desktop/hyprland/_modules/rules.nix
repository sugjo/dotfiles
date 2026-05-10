{
    wayland.windowManager.hyprland.settings = {
        workspace = [
            "f[1], gapsout:0, gapsin:0, rounding:true, bordersize:0"
        ];
        windowrule = [
            "rounding 12, match:fullscreen 1"
            "match:class kitty, opacity 0.85 override 0.85 override 1.0 override"
        ];
        layerrule = [
            "blur on, match:namespace noctalia-background-.*"
            "ignore_alpha 0.5, match:namespace noctalia-background-.*"
            "blur on, match:namespace noctalia-notifications"
        #     "blur on, match:namespace ^noctalia-(bar|toast).*$"
        #     "xray 1, match:namespace ^noctalia-(bar-content|toast).*$"
        #
# 2. Оптимизация для устранения артефактов прозрачности
# "ignorealpha 0.5, match:na^noctalia-(background|bar|toast).*$"

# 3. Размытие для всплывающих уведомлений (toasts)
# "blurpopups, match:^noctalia-toast.*$"
        ];
    };
}

