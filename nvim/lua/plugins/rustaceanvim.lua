local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.g.rustaceanvim = {
    tools = {
    },
    server = {
        capabilities = lsp_capabilities,
        default_settings = {
            ['rust-analyzer'] = {
            },
        },
    },
    dap = {
    },
}
