{ config, ... }: {
    programs.nixvim = {
        plugins = {
            oil = {
                enable = true;
                settings = {
                    view_options.show_hidden = true;
                    win_options.signcolumn = "yes";
                };
            };
            treesitter = {
                enable = true;
                settings.highlight.enable = true;
            };
            gitsigns = {
                enable = true;
                signcolumn = true;
            };
            lspconfig.enable = true;
            luasnip.enable = true;
            blink-cmp = {
                enable = true;
                settings = {
                    appearance = {
                        use_nvim_cmp_as_default = true;
                    };
                    cmdline.enabled = false;
                    snippets.preset = "luasnip";
                    keymap = {
                        "<Tab>" = [
                            "select_next"
                            "fallback"
                        ];
                        "<S-Tab>" = [
                            "select_prev"
                            "fallback"
                        ];
                        "<CR>" = [
                            "select_and_accept"
                            "fallback"
                        ];
                        "<C-space>" = [
                            "show"
                            "show_documentation"
                            "hide_documentation"
                        ];
                    };
                };
            };
            hlchunk = {
                enable = true;
                settings = {
                  chunk = {
                    chars = {
                      horizontal_line = "─";
                      left_bottom = "╰";
                      left_top = "╭";
                      right_arrow = "─";
                      vertical_line = "│";
                    };
                    enable = true;
                    style = if config.lib ? stylix then [
                        {
                            fg = config.lib.stylix.colors.withHashtag.base0E;
                        }
                    ] else [];
                    use_treesitter = true;
                    duration = 80;
                    delay = 150;
                  };
                  indent = {
                    enable = true;
                    chars = [ "│" "¦" "┆" "┊" ];
                    style = if config.lib ? stylix then [
                        {
                            fg = config.lib.stylix.colors.withHashtag.base0D;
                        }
                    ] else [];
                    use_treesitter = true;
                  };
                };
            };
            mini-pick.enable = true;
            mini-statusline.enable = true;
            web-devicons.enable = true;
            nvim-colorizer.enable = true;
            dressing.enable = true;
            flash.enable = true;
        };
    };
}
