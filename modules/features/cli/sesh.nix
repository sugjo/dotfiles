{ pkgs, ... }: {
    flake.modules.nixos.sesh = { ... }: {
        hm = [{
            programs.sesh = {
                enable = true;
                enableTmuxIntegration = false;
                settings = {
                    default_session = {
                        startup_command = ''
                            tmux rename-window -t 1 "Shell"
                            tmux new-window -t "''${SESH_NAME}:2" -n "Writing" "''${SHELL} -c 'nvim .; ''${SHELL}'"
                            tmux select-window -t "''${SESH_NAME}:1"
                            clear
                            eza --all --git --icons --color=always
                            exec ''${SHELL}
                        '';
                    };
                    wildcard = map (path: {
                        pattern = "${path}/*";
                        startup_command = ''
                            #!/bin/bash
                            tmux rename-window -t 1 "Shell"
                            tmux new-window -t "$SESH_NAME:2" -n 'Writing' "$SHELL -c 'nvim .; $SHELL'"
                            tmux new-window -t "$SESH_NAME:3" -n 'Serve'
                            tmux select-window -t "$SESH_NAME:2"
                            clear
                            eza --all --git --icons --color=always
                        '';
                    }) [ "~/Documents" "~/Projects" "~/.config" ];
                };
            };
        }];
    };
}
