vim.opt.nu = true
vim.opt.relativenumber = true

vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- vim.opt.cursorline = false

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

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"

vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true

vim.opt.mouse = "a"
vim.g.editorconfig = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.statusline" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },
})

require("mason").setup({})
require("mini.icons").setup({})
require("mini.statusline").setup({})
require("mini.pick").setup({})
require('mini.pairs').setup({})
require('nvim-treesitter').setup({})
require("oil").setup({
    view_options = {
        show_hidden = true
    }
})

require('nvim-treesitter').install { 'svelte', 'markdown', 'lua', 'rust', 'typescript', 'tsx', 'javascript', 'c', 'cpp' }
require('nvim-ts-autotag').setup({
    opts = {
        enable_close = true,          -- Auto close tags
        enable_rename = true,         -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
    },
})

require("gruvbox").setup({
    terminal_colors = true,
    transparent_mode = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fg", ":Pick grep live<CR>")

vim.cmd("colorscheme gruvbox")

require('mason-tool-installer').setup {
    ensure_installed = {
        'prettierd'
    },
    auto_update = true,
    integrations = {
        ['mason-lspconfig'] = true,
    },
}

local servers = {
    emmet_language_server = {},
    docker_language_server = {},
    bashls = {},
    marksman = {},
    biome = {},
    ts_ls = {},
    html = {},
    cssls = {},
    yamlls = {},
    gitlab_ci_ls = {},
    lua_ls = {
        settings = {
            Lua = {
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                }
            }
        }

    }
}

local ensure_installed = vim.tbl_keys(servers or {})

require("mason-lspconfig").setup({ ensure_installed = ensure_installed })

for server_name, config in pairs(servers) do
    vim.lsp.config(server_name, config)
end


vim.keymap.set('i', '<c-space>', function()
    vim.lsp.completion.get()
end)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})

vim.cmd("set completeopt+=noselect")

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    desc = "highlight selection on yank",
    callback = function()
        vim.highlight.on_yank({ timeout = 200, visual = true })
    end,
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("no_auto_comment", {}),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.filetype.add({
    pattern = {
        ['%.gitlab%-ci%.ya?ml'] = 'yaml.gitlab',
    },
})
