{
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
            mini-pick.enable = true;
            mini-statusline.enable = true;
            web-devicons.enable = true;
            nvim-colorizer.enable = true;
            dressing.enable = true;
            flash.enable = true;
        };
    };
}
