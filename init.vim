"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/kcvlex/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/kcvlex/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/home/kcvlex/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-fugitive')
call dein#add('AlessandroYorba/Alduin')
call dein#add('miyakogi/seiya.vim')
call dein#add('simeji/winresizer')
call dein#add('rust-lang/rust.vim')
call dein#add('neovim/nvim-lspconfig')
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------



if !has('nvim')
    set clipboard=unnamed,autoselect
else
    "set clipboard+=unnamedplus
endif
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1
nnoremap j gj
nnoremap k gk
nnoremap <ESC><ESC> :noh<CR>

"Indent
let g:seiya_auto_enable=1

"Colerschema configuration
let g:alduin_Shout_Aura_Whisper = 1
colorscheme alduin

"TeX
let g:tex_flavor = 'latex'

"Default configuration
syntax on
set fileencodings=utf-8,cp932
set number
set noswapfile
set smartindent
set virtualedit=onemore
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
set autoread
set inccommand=""
set viminfo='100,<0,s10,h
autocmd CursorHold * checktime
highlight LineNr ctermfg=239
autocmd FileType scala set shiftwidth=2 tabstop=2 smartindent expandtab
autocmd FileType javascript set shiftwidth=2 tabstop=2 smartindent expandtab
autocmd FileType ocaml set shiftwidth=2 tabstop=2 smartindent expandtab
set cindent cino=N-s,j1,(0,ws,Ws
autocmd BufNewFile,BufRead *.tsx  set filetype=typescript syntax=typescript
autocmd BufNewFile,BufRead *.hv  set filetype=verilog_systemverilog syntax=verilog_systemverilog
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType vue setlocal shiftwidth=2
autocmd FileType typescript setlocal shiftwidth=2

" autocmd BufNewFile,BufRead *.coq.v set filetype=coq syntax=coq sw=2 ts=2 smartindent expandtab


:lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}
EOF

au FileType * setlocal formatoptions-=cro
