{
    programs.nixvim = {
        keymaps = [
            {
                action = "<cmd>Oil<CR>";
                key = "-";
                mode = "n";
            }
            {
                mode = "n";
                key = "<leader>fd";
                action = "<cmd>Pick files<cr>";
            }
            {
                mode = "n";
                key = "<leader>fg";
                action = "<cmd>Pick grep_live<cr>";
            }
            # Центрирование экрана при прокрутке (Ctrl+d и Ctrl+u)
            {
              mode = "n";
              key = "<C-d>";
              action = "<C-d>zz";
              options.noremap = true;
            }
            {
              mode = "n";
              key = "<C-u>";
              action = "<C-u>zz";
              options.noremap = true;
            }

            # Центрирование экрана при поиске (следующее/предыдущее совпадение)
            {
              mode = "n";
              key = "n";
              action = "nzzzv";
              options.noremap = true;
            }
            {
              mode = "n";
              key = "N";
              action = "Nzzzv";
              options.noremap = true;
            }

            # Форматирование кода через встроенный LSP
            {
              mode = "n";
              key = "<leader>lf";
              action.__raw = "vim.lsp.buf.format";
              options.noremap = true;
            }
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
                action = "<cmd>lua require('flash').jump()<cr>";
                options.desc = "Flash Jump";
            }
        ];
    };
}
