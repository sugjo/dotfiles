{ osConfig, ... }:
{
    wayland.windowManager.hyprland.settings = {
        exec-once = [
            "noctalia-shell"
            "hyprpaper"
            "[workspace 1 silent] ${osConfig.desktop.terminal.run} tmux"
            "[workspace 3 silent;noanim;nodim] ${osConfig.desktop.browser}"
            "[workspace 4 silent;noscreenshare] Telegram"
            "[workspace 4 silent;noanim;noscreenshare] command -v vesktop &> /dev/null && vesktop"
            "[workspace 0 silent;noanim] Throne"
        ];
    };
}
