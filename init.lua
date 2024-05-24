local Plug = vim.fn['plug#']

vim.call('plug#begin')
    Plug 'tpope/vim-fugitive'
    Plug 'AlessandroYorba/Alduin'
    Plug 'miyakogi/seiya.vim'
    Plug 'simeji/winresizer'
    Plug 'rust-lang/rust.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'neovim/nvim-lspconfig'
    Plug 'Yggdroot/indentLine'
    Plug 'hashivim/vim-terraform'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
vim.call('plug#end')

vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1
vim.g.indent_guides_enable_on_vim_startup = 1

vim.g.alduin_Shout_Aura_Whisper = 1
vim.cmd.colorscheme('alduin')

vim.opt.fileencodings = 'utf-8'
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.smartindent = true
vim.opt.virtualedit = 'onemore'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoread = true
vim.opt.inccommand = ''
vim.opt.viminfo = { '\'100', '<0', 's10', 'h' }

vim.g.mapleader = ','
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', '<ESC><ESC>', '<cmd>noh<CR>', { noremap = true })

vim.cmd.highlight({ 'LineNr', 'ctermfg=239' })

local on_lsp_buffer_enabled = function()
    vim.opt_local.omnifunc = 'lsp#complete'
    vim.opt_local.signcolumn = 'yes'

    if vim.fn.exists('+tagfunc') then
        vim.opt_local.tagfunc = 'lsp#tagfunc'
    end

    vim.keymap.set('n', 'gd', '<plug>(lsp-definition)', { buffer = true })
    -- vim.keymap.set('n', 'gs', '<plug>(lsp-document-symbol-search)', { buffer = true })
    vim.keymap.set('n', 'gs', '<C-w>]', { buffer = true })
    vim.keymap.set('n', 'gv', '<C-w>v', { buffer = true })
    vim.keymap.set('n', 'gS', '<plug>(lsp-workspace-symbol-search)', { buffer = true })
    vim.keymap.set('n', 'gr', '<plug>(lsp-references)', { buffer = true })
    vim.keymap.set('n', 'gi', '<plug>(lsp-implementation)', { buffer = true })
    vim.keymap.set('n', 'gt', '<plug>(lsp-type-definition)', { buffer = true })
    vim.keymap.set('n', '<leader>rn', '<plug>(lsp-rename)', { buffer = true })
    -- nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    -- nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    -- nmap <buffer> K <plug>(lsp-hover)
end

local cmp = require'cmp'
cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
  -- { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
})
})

local lsp_group = vim.api.nvim_create_augroup('lsp_install', { clear = true })
vim.api.nvim_create_autocmd({ 'User' }, {
    pattern = 'lsp_buffer_enabled',
    callback = on_lsp_buffer_enabled
})

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {
    },
  },
  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end
}
