vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.backup = false
vim.undofile = true

vim.opt.showmode = false

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.o.winborder = "rounded"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true

vim.opt.mouse = "a"
vim.g.editorconfig = true

vim.diagnostic.config({
    virtual_text = true,      -- Shows the error/warning as text at the end of the line
    signs = true,             -- Shows an icon in the sign column
    update_in_insert = false, -- Diagnostics are hidden in insert mode by default
    -- You might want to adjust other settings here, like "underline"
})

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", multispace = "|   "}
