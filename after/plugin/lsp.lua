local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()
end)
-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                single_file_support = false,
                on_attach = function(client, bufnr)
                    print('hi lua')
                end
            })
        end,
        jdtls = function()
            require('lspconfig').jdtls.setup({
                single_file_support = false,
                on_attach = function(client, bufnr)
                    print('hi java')
                end
            })
        end,
        rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup({
                single_file_support = false,
                on_attach = function(cliente, bufnr)
                    print('hi rust')
                end
            })
        end,
    },
})

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['jdtls'] = { 'java' },
    }
})

require('lspconfig').lua_ls.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').jdtls.setup({})
