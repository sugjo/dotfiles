vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },
})

require('nvim-treesitter').setup({})
require('nvim-treesitter').install {
    'lua',
    'rust',
    'markdown',
    'typescript',
    'javascript',
    'tsx',
}

require("mason").setup({})

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

require("treesitter-context").setup({
    multiline_threshold = 1,
    mode = 'cursor',
    separator = "-",
})

require('nvim-ts-autotag').setup({
    opts = {
        enable_close = true,          -- Auto close tags
        enable_rename = true,         -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
    },
})

vim.cmd("set completeopt+=noselect")

vim.keymap.set('i', '<c-space>', function()
    vim.lsp.completion.get()
end)

vim.filetype.add({
    pattern = {
        ['%.gitlab%-ci%.ya?ml'] = 'yaml.gitlab',
    },
})
