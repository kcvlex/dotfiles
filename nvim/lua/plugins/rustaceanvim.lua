local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('plugins.lsp')

vim.g.rustaceanvim = {
    tools = {
    },
    server = {
        on_attach = lsp.on_attach,
        capabilities = lsp_capabilities,
        default_settings = {
            ['rust-analyzer'] = {
            },
        },
    },
    dap = {
    },
}
