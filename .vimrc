"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/taroy/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/taroy/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'AlessandroYorba/Alduin'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nikvdp/ejs-syntax'
NeoBundle 'miyakogi/seiya.vim'
NeoBundle 'simeji/winresizer'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"Default configuration
syntax on
set fenc=utf-8
set number
set smartindent
set virtualedit=onemore
set showmatch
set tabstop=4
set shiftwidth=4
if !has('nvim')
    set clipboard=unnamed,autoselect
else
    "set clipboard+=unnamedplus
endif
set ts=4 sw=4 et
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

"Syntastic configuration
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"Verilog
"if filereadable(expand('~/.vim/src/verilog.vim'))
"    source ~/.vim/src/verilog.vim
"endif
