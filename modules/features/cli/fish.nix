{
    flake.modules.nixos.fish = {
        programs.fish.enable = true;
        hm = [{
            programs.fish = {
                enable = true;
                interactiveShellInit = ''
                    set -g fish_greeting "" 
                '';
            };
            programs.oh-my-posh = {
                enable = true;
                enableFishIntegration = true;

                settings = {
                    version = 3;
                    final_space = true;
                    blocks = [
                        {
                            alignment = "left";
                            type = "prompt";
                            segments = [
                                {
                                    type = "path";
                                    style = "plain";
                                    foreground = "6"; # ANSI Cyan (base0C)
                                    template = "{{ .Path }} ";
                                    properties = { style = "full"; };
                                }
                                {
                                    type = "git";
                                    style = "plain";
                                    foreground = "2"; # ANSI Green (base0B)
                                    template = "{{ .HEAD }} ";
                                }
                                {
                                    type = "root";
                                    style = "plain";
                                    foreground = "3"; # ANSI Yellow (base0A)
                                    template = "  ";
                                }
                                {
                                    type = "status";
                                    style = "plain";
                                    foreground = "1"; # ANSI Red (base08)
                                    template = "x{{ reason .Code }} ";
                                }
                            ];
                        }
                        {
                            alignment = "left";
                            type = "prompt";
                            newline = true;
                            segments = [
                                {
                                    type = "text";
                                    style = "plain";
                                    foreground = "4"; # ANSI Blue (base0D)
                                    template = ">";
                                }
                            ];
                        }
                    ];
                };
            };
        }];
    };
}
