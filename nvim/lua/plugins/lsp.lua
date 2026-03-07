local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local M = {}

function M.on_attach(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil

    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gs', '<C-w>]', { buffer = bufnr, noremap = true })
    vim.keymap.set('n', 'gS', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
end

lspconfig.clangd.setup {
    capabilities = lsp_capabilities,
    on_attach = M.on_attach,
}

lspconfig.pylsp.setup {
    capabilities = lsp_capabilities,
    on_attach = M.on_attach,
}

lspconfig.cmake.setup {
    capabilities = lsp_capabilities,
    on_attach = M.on_attach,
}

return M
