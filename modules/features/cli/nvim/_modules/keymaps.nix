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
            }
            {
                mode = [ "n" "x" "o" ];
                key = "s";
                action.__raw = "require('flash').jump";
            }
        ];
    };
}
