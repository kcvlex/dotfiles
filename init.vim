call plug#begin()
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
call plug#end()

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

"TeX
let g:tex_flavor = 'latex'

"Default configuration
syntax on
set fileencodings=utf-8
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

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " let g:lsp_format_sync_timeout = 1000
    " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:airline_powerline_fonts = 1

:lua << EOF
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
EOF

"Colerschema configuration
let g:alduin_Shout_Aura_Whisper = 1
colorscheme alduin

au FileType * setlocal formatoptions-=ro
