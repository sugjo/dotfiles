vim.g.mapleader = " "

vim.keymap.set('n', "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set('n', "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set('n', "n", "nzzzv", { noremap = true })
vim.keymap.set('n', "N", "Nzzzv", { noremap = true })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
