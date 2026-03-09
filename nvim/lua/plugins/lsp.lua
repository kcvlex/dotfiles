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

local servers = {
    clangd = {
        cmd = { 'clangd' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
        root_markers = { '.clangd', 'compile_commands.json', 'compile_flags.txt', '.git' },
    },
    pylsp = {
        cmd = { 'pylsp' },
        filetypes = { 'python' },
        root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', '.git' },
    },
    cmake = {
        cmd = { 'cmake-language-server' },
        filetypes = { 'cmake' },
        root_markers = { 'CMakeLists.txt', '.git' },
    },
}

for name, config in pairs(servers) do
    config.capabilities = lsp_capabilities
    vim.lsp.config(name, config)
end

vim.lsp.enable(vim.tbl_keys(servers))

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        M.on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
    end,
})

return M
