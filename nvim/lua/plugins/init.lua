local Plug = vim.fn['plug#']

vim.call('plug#begin')
    Plug 'tpope/vim-fugitive'
    Plug 'AlessandroYorba/Alduin'
    Plug 'miyakogi/seiya.vim'
    Plug 'simeji/winresizer'
    Plug 'rust-lang/rust.vim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'Yggdroot/indentLine'
    Plug 'hashivim/vim-terraform'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'github/copilot.vim'
    Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install' })
    Plug 'mrcjkb/rustaceanvim'
    Plug 'chrisgrieser/nvim-lsp-endhints'
vim.call('plug#end')
