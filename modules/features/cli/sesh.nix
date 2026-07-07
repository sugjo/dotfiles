{
    flake.modules.nixos.sesh = { lib, ... }:
    let
      tmuxpStartupCmd = template: ''
        exec tmuxp load -a ${template} -s "$SESH_NAME"
      '';
      paneRun = command: devenvCommand: 
        "clear && { [ -f devenv.nix ] && devenv shell${if devenvCommand == "" then "" else " " + devenvCommand} || ${command}; }";

      projectPaths = [ "~/Documents" "~/Projects" "~/.config" ];
    in
    {
        hm = [{
            xdg.configFile."tmuxp/default.yaml".text = lib.generators.toYAML {} {
                session_name = "default";
                windows = [
                    {
                        window_name = "Shell";
                        layout = "tiled";
                        panes = [ (paneRun "$SHELL" "") ];
                    }
                    {
                        window_name = "Nvim";
                        layout = "tiled";
                        focus = true;
                        panes = [ (paneRun "nvim ." "nvim .") ];
                    }
                    {
                      window_name = "Serve";
                      layout = "tiled";
                      panes = [ (paneRun "$SHELL" "") ];
                    }
                ];
            };
            programs.sesh = {
                enable = true;
                enableTmuxIntegration = true;
                settings = {
                    default_session = {
                        startup_command = tmuxpStartupCmd "default";
                    };
                    wildcard = map (path: {
                        pattern = "${path}/*";
                        startup_command = tmuxpStartupCmd "default";
                    }) projectPaths;
                };
            };
        }];
    };
}
