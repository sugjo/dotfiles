{
    flake.modules.nixos.tmux = { ... }: {
        hm = [{
            programs.tmux = {
                enable = true;
                terminal = "xterm-256color";
                prefix = "M-SPACE";
                baseIndex = 1;
                keyMode = "vi";
                reverseSplit = false;
                customPaneNavigationAndResize = false; 
                mouse = true; 

                extraConfig = ''
                    set -g allow-passthrough on
                    set -g renumber-windows on
                    set -g detach-on-destroy off
                    set -g status-position top
                    set -g status-justify absolute-centre
                    set -g status-style "bg=default"

                    set -g status-interval 5
                    set -g status-right ""
                    set -g status-left " #S:"

                    bind r source-file "~/.config/tmux/tmux.conf"

                    bind h select-pane -L
                    bind j select-pane -D
                    bind k select-pane -U
                    bind l select-pane -R

                    unbind %
                    bind | split-window -h -c "#{pane_current_path}"

                    unbind '"'
                    bind - split-window -v -c "#{pane_current_path}"

                    bind-key -T copy-mode-vi v send-keys -X begin-selection
                    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
                    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
                    unbind -T copy-mode-vi MouseDragEnd1Pane

                    bind-key -n M-s run-shell "sesh last"

                    bind -n M-h select-pane -L
                    bind -n M-j select-pane -D
                    bind -n M-k select-pane -U
                    bind -n M-l select-pane -R

                    bind -n M-1 select-window -t 1
                    bind -n M-2 select-window -t 2
                    bind -n M-3 select-window -t 3
                    bind -n M-4 select-window -t 4
                    bind -n M-5 select-window -t 5
                    bind -n M-6 select-window -t 6
                    bind -n M-7 select-window -t 7
                    bind -n M-8 select-window -t 8
                    bind -n M-9 select-window -t 9
                  '';
            };
        }];
    };
}
