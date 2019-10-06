"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/taroy/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/taroy/.cache/dein')
  call dein#begin('/home/taroy/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/taroy/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('tpope/vim-fugitive')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('AlessandroYorba/Alduin')
  call dein#add('miyakogi/seiya.vim')
  call dein#add('simeji/winresizer')
  call dein#add('derekwyatt/vim-scala')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

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

"Default configuration
syntax on
set fenc=utf-8
set number
set noswapfile
set smartindent
set virtualedit=onemore
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
set autoread
setlocal cindent cino=N-s,j1,(0,ws,Ws
autocmd CursorHold * checktime
highlight LineNr ctermfg=239
autocmd FileType scala setlocal shiftwidth=2 tabstop=2 smartindent expandtab
