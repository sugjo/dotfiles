{
    programs.nixvim =
    let
        bind = mode: key: action: { mode = mode; key = key; action = action; };
    in
    {
        keymaps = [
            (bind "n" "-" "<cmd>Oil<CR>")
            (bind "n" "<leader>fd" "<cmd>Pick files<cr>")
            (bind "n" "<leader>fg" "<cmd>Pick grep_live<cr>")
            (bind "n" "<C-d>" "<C-d>zz")
            (bind "n" "<C-u>" "<C-u>zz")
            (bind "n" "n" "nzzzv")
            (bind "n" "N" "Nzzzv")
            {
              mode = "n";
              key = "<leader>lf";
              action.__raw = "vim.lsp.buf.format";
            {
                mode = "i";
                key = "<C-Space>";
                action.__raw = ''
                    function()
                        vim.lsp.completion.get()
                    end
                '';
                options = {
                    noremap = true;
                    silent = true;
                    desc = "Trigger LSP completion";
                };
            }
            {
                mode = [ "n" "x" "o" ];
                key = "s";
                action.__raw = "require('flash').jump";
            }
        ];
    };
}
