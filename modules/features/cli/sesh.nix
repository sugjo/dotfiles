{ pkgs, ... }: {
    flake.modules.nixos.sesh = { ... }: {
        hm = [{
            xdg.configFile."tmuxp/default.yaml".text = ''
                session_name: "''${PWD}"
                windows:
                  - window_name: Shell
                    layout: tiled
                    panes:
                      - '[ -f devenv.nix ] && devenv shell || $SHELL'
                  - window_name: Nvim
                    layout: tiled
                    focus: true
                    panes:
                      - '[ -f devenv.nix ] && devenv shell nvim . || nvim .'
                  - window_name: Serve
                    layout: tiled
                    panes:
                      - '[ -f devenv.nix ] && devenv shell || $SHELL'
            '';
            programs.sesh = {
                enable = true;
                enableTmuxIntegration = false;
                settings = {
                    default_session = {
                        startup_command = ''
                            #!/bin/bash
                            exec tmuxp load -a default -s "$SESH_NAME"
                        '';
                    };
                    wildcard = map (path: {
                        pattern = "${path}/*";
                        startup_command = ''
                            #!/bin/bash
                            exec tmuxp load -a default -s "$SESH_NAME"
                        '';
                    }) [ "~/Documents" "~/Projects" "~/.config" ];
                };
            };
        }];
    };
}
