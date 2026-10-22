{
    programs.nixvim =
    let
        bind = mode: key: action: { mode = mode; key = key; action = action; };
    in
    {
        keymaps = [
            (bind "n" "-" "<cmd>Oil<CR>")
            (bind "n" "<leader>f" "<cmd>Pick files<cr>")
            (bind "n" "<leader>g" "<cmd>Pick grep_live<cr>")
            (bind "n" "<C-d>" "<C-d>zz")
            (bind "n" "<C-u>" "<C-u>zz")
            (bind "n" "<leader>a" "<cmd>lua require('harpoon'):list():add()<CR>")
            (bind "n" "<leader>h" "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>")
            (bind "n" "<leader>1" "<cmd>lua require('harpoon'):list():select(1)<CR>")
            (bind "n" "<leader>2" "<cmd>lua require('harpoon'):list():select(2)<CR>")
            (bind "n" "<leader>3" "<cmd>lua require('harpoon'):list():select(3)<CR>")
            (bind "n" "<leader>4" "<cmd>lua require('harpoon'):list():select(4)<CR>")
            (bind "n" "n" "nzzzv")
            (bind "n" "N" "Nzzzv")
            (bind "n" "<leader>x" "\"_x")
            (bind "v" "<leader>x" "\"_x")
            (bind "n" "<leader>X" "\"_X")
            (bind "v" "<leader>X" "\"_X")
            (bind "v" "<leader>p" "\"_dP")
            { mode = "n"; key = "<leader>a"; action.__raw = "function() require'harpoon':list():add() end"; }
            { mode = "n"; key = "<C-e>"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
            { mode = "n"; key = "<C-j>"; action.__raw = "function() require'harpoon':list():select(1) end"; }
            { mode = "n"; key = "<C-k>"; action.__raw = "function() require'harpoon':list():select(2) end"; }
            { mode = "n"; key = "<C-l>"; action.__raw = "function() require'harpoon':list():select(3) end"; }
            { mode = "n"; key = "<C-m>"; action.__raw = "function() require'harpoon':list():select(4) end"; }
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
