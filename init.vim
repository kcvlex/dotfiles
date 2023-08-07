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
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')
"call dein#add('neovim/nvim-lspconfig')
"call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

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

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:airline_powerline_fonts = 1
