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
            mini-pick.enable = true;
            mini-statusline.enable = true;
            web-devicons.enable = true;
            nvim-colorizer.enable = true;
            dressing.enable = true;
            flash.enable = true;
        };
    };
}
