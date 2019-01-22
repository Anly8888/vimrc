set nocompatible                    "We want the latest Vim settings/options

syntax enable

let mapleader=","                   "The default leader is \, but a comma is much better.
"set number                         "Let's activate the line numbers.

set tabstop=4
set expandtab
set softtabstop=0
set shiftwidth=4

set ruler                           "Display the current cursor position.
set showcmd                         "Display an incomplete command.
"set laststatus=0                   "Hide status line
set backspace=indent,start,eol

set ttimeout
set ttimeoutlen=50                  "Eliminating the delays on ESC

"set clipboard=unnamedplus           "default clipboard uses "+


"---------------Plugins-------------------"


filetype off                        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

"Plugin 'tpope/vim-vinegar'
"Plugin 'scrooloose/nerdtree'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'mileszs/ack.vim'
"Plugin 'dkprice/vim-easygrep'
Plugin 'skwp/greplace.vim'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'
"Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
"Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
"Plugin 'jiangmiao/auto-pairs'

" git
Plugin 'tpope/vim-fugitive'

" Snippets
Plugin 'SirVer/ultisnips'

" markdown folding
Plugin 'nelstrom/vim-markdown-folding'

" Plantuml
Plugin 'aklt/plantuml-syntax'
Plugin 'tyru/open-browser.vim'
Plugin 'weirongxu/plantuml-previewer.vim'

" easy align
Plugin 'junegunn/vim-easy-align'

" QML
Plugin 'peterhoeg/vim-qml'

" Asynchronous Lint Engine
Plugin 'w0rp/ale'

" You Complete Me
Plugin 'Valloric/YouCompleteMe'

" Input method switcher
Plugin 'lyokha/vim-xkbswitch'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plugin 'junegunn/fzf', { 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Paper color
Plugin 'NLKNguyen/papercolor-theme'

" air line
" note: This plugin slows vim down
"Plugin 'vim-airline/vim-airline'

" tagbar
"Plugin 'majutsushi/tagbar'

" auto update tags
Plugin 'ludovicchabant/vim-gutentags'

" All of your Plugins must be added before the following line
call vundle#end()                   " required
filetype plugin indent on           " required

if !has('nvim')
    "Load the man filetype plugin
    runtime! ftplugin/man.vim
endif







"---------------Macvim specific-------------------"
set linespace=6                     "Macvim specific line-height.




"---------------Visuals-------------------"


set background=dark
colorscheme PaperColor

if has('gui_running')
    set guifont=Monaco:h18
endif

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"Highlight current line
"set cursorline

"Line number background
"highlight LineNr ctermbg=bg

"Left margin
"set foldcolumn=2
"highlight foldcolumn ctermbg=bg

highlight vertsplit ctermbg=bg ctermfg=bg guibg=bg guifg=bg




"---------------Search-------------------"


set hlsearch
set incsearch
set ignorecase





"---------------Split Management-------------------"

nmap <leader>j <c-w><c-j>
nmap <leader>h <c-w><c-h>
nmap <leader>k <c-w><c-k>
nmap <leader>l <c-w><c-l>





"---------------Mapping-------------------"

"Make it easier to edit the Vimrc file."
map <leader>ev :tabedit ~/.vimrc<cr>

"Add simple highlight removal.
map <leader><space> :nohlsearch<cr>

"Use Space key to scroll down
map <space> <c-f>





"---------------Plugins-------------------"

"/
"/ fzf
"/

nmap <c-p> :FZF<cr>

"/
"/ greplace
"/
set grepprg=rg\ -nH

"/
"/ Vim php namespace
"/

" Insert use namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" Expand to full quoted namespace
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

"/
"/ easy align
"/

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Align markdown table columns
nmap gat vit:'<,'>EasyAlign 3/<t.>/ r0alllll<cr>


"---------------PHP lang-------------------"

" Sort selected lines by length
vmap <leader>sn ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>


"---------------vim-xkbswitch-------------------"

let g:XkbSwitchEnabled = 1
let g:XkbSwitchNLayout = 'us'

"/
"/ Snippets
"/
let g:UltiSnipsExpandTrigger="<c-j>"


"---------------Auto-command-------------------"

"Automatically source the Vimrc file on save.
augroup autosourcing
    "Remove all vimrc autocommands.
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup end

augroup openhelp
    " Open help in a vertical splitted window
    autocmd FileType help wincmd L
    "autocmd FileType help :vertical resize 80<cr>
augroup end



"---------------auto load .vimrc-------------------"

"Enables the reading of .vimrc and .exrc in the current directory.
"set exrc
"shell and write commands are not allowed in
"set secure

