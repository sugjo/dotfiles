{
    wayland.windowManager.hyprland.settings = {
        exec-once = [
            "noctalia-shell"
            "[workspace 1 silent] ${osConfig.desktop.terminal.run} tmux"
            "[workspace 4 silent;noscreenshare] Telegram"
            "[workspace 4 silent;noanim;noscreenshare] command -v vesktop &> /dev/null && vesktop"
            "[workspace 0 silent;noanim] Throne"
        ];
    };
}
