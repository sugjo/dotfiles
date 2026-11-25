{ channel, choiceFile, ... }:
{
  programs.television.channels.${channel} = {
    metadata = {
      name = channel;
      description = "WezTerm workspace manager";
      requirements = [ "wezterm-session" "tv" "zoxide" "fd" "eza" ];
    };

    source = {
      ansi = false;
      frecency = false;
      no_sort = true;
      display = "{split:|:0}";
      output = "{}";
      command = [
        { name = "All"; run = "wezterm-session list all"; }
        { name = "Workspaces"; run = "wezterm-session list workspaces"; }
        { name = "Configs"; run = "wezterm-session list configs"; }
        { name = "Zoxide"; run = "wezterm-session list zoxide"; }
        { name = "Directories"; run = "wezterm-session list dirs"; }
      ];
    };

    preview = {
      command = "wezterm-session preview '{}'";
    };

    keybindings = {
      enter = "actions:connect";
      ctrl-d = [ "actions:kill_session" "reload_source" ];
    };

    actions = {
      connect = {
        description = "Switch to or create WezTerm workspace";
        command = "wezterm-session connect '{}' ${choiceFile}";
        mode = "execute";
      };
      kill_session = {
        description = "Kill selected WezTerm workspace";
        command = "wezterm-session kill '{}'";
        mode = "fork";
      };
    };
  };
}
