{
    flake.modules.nixos.television= { pkgs, ... }: {
        hm = [{
            programs.television = {
                enable = true;
                channels = {
                    sesh = {
                      metadata = {
                        name = "sesh";
                        description = "Session manager integrating tmux sessions, zoxide directories, and config paths";
                        requirements = [ "sesh" "fd" ];
                      };

                      source = {
                        ansi = true;
                        frecency = false;
                        no_sort = true;
                        output = "{strip_ansi|split: :1..|join: }";
                        command = [
                          { name = "All"; run = "sesh list --icons"; }
                          { name = "Tmux"; run = "sesh list -t --icons"; }
                          { name = "Configs"; run = "sesh list -c --icons"; }
                          { name = "Zoxide"; run = "sesh list -z --icons"; }
                          { name = "Directories"; run = "fd -H -d 2 -t d -E .Trash . ~"; }
                        ];
                      };

                      preview = {
                        command = "sesh preview '{strip_ansi|split: :1..|join: }'";
                      };

                      keybindings = {
                        enter = "actions:connect";
                        ctrl-d = [ "actions:kill_session" "reload_source" ];
                      };

                      actions = {
                        connect = {
                          description = "Connect to selected session";
                          command = "sesh connect '{strip_ansi|split: :1..|join: }'";
                          mode = "execute";
                        };
                        kill_session = {
                          description = "Kill selected tmux session (press Ctrl+r to reload)";
                          command = "tmux kill-session -t '{strip_ansi|split: :1..|join: }'";
                          mode = "fork";
                        };
                      };
                    };
                };
            };

            home.packages = with pkgs; [
                sesh
                fd
                tmux
            ];
        }];
    };
}
