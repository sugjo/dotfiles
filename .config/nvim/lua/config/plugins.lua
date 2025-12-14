vim.pack.add({
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.statusline" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
})

require("mini.icons").setup({})
require("mini.statusline").setup({})
require('mini.pairs').setup({})
require("mini.pick").setup({})

require("gruvbox").setup({
    terminal_colors = true,
    transparent_mode = true,
})

require("oil").setup({
    view_options = {
        show_hidden = true
    }
})

vim.cmd("colorscheme gruvbox")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>fd", ":Pick files<CR>", {})
vim.keymap.set("n", "<leader>fg", ":Pick grep live<CR>", {})
