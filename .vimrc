set nocompatible                    "We want the latest Vim settings/options

syntax enable

let mapleader=","                   "The default leader is \, but a comma is much better.
"set number                         "Let's activate the line numbers.
set scrolloff=5

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

set clipboard=unnamed               "default clipboard uses "+

" Enable OS mouse clicking and scrolling
"
" Note for Mac OS X: Requires SIMBL and MouseTerm
"
" http://www.culater.net/software/SIMBL/SIMBL.php
" https://bitheap.org/mouseterm/
if has("mouse")
    set mouse=a
endif

set autowrite
" The current buffer can be put to the background without writing to disk
set hidden


"---------------Plugins-------------------"


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'skwp/greplace.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'

" git
Plug 'tpope/vim-fugitive'

" Snippets
Plug 'SirVer/ultisnips'

" markdown folding
Plug 'nelstrom/vim-markdown-folding'

" Plantuml
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

" easy align
Plug 'junegunn/vim-easy-align'

" QML
Plug 'peterhoeg/vim-qml'

" You Complete Me
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }

" clang-complete
"Plugin 'xavierd/clang_complete'

" Input method switcher
Plug 'rlue/vim-barbaric'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Paper color
Plug 'NLKNguyen/papercolor-theme'

" auto update tags
Plug 'ludovicchabant/vim-gutentags'

" line diff
Plug 'AndrewRadev/linediff.vim'

" python indent
Plug 'Vimjas/vim-python-pep8-indent'

" comments
Plug 'tomtom/tcomment_vim'

" indent object
Plug 'michaeljsmith/vim-indent-object'

" Initialize plugin system
call plug#end()


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

highlight vertsplit ctermbg=bg ctermfg=bg guibg=bg guifg=bg




"---------------Search-------------------"


set hlsearch
set incsearch
set ignorecase
set smarttab





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

"Open current file in Google Chrome
if has('mac')
    command! Chrome silent exe "!open -a 'Google Chrome'" shellescape("%") | redraw!
else
    command! Chrome silent exe "!google-chrome" shellescape("%") | redraw!
endif
map <leader>c :Chrome<cr>





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
"/ easy align
"/

let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Align markdown table columns
nmap gat vit:'<,'>EasyAlign 3/<t.>/ r0alllll<cr>

"/
"/ you complete me
"/

let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_global_ycm_extra_conf = '~/projects/vimrc/.ycm_extra_conf.py'
let g:ycm_clangd_args = ['-std=c++17']

nmap <f2> :YcmCompleter GoTo<cr>
nmap <f4> :YcmCompleter GoToInclude<cr>

"/
"/ clang-complete
"/
"if has('mac')
"    let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"else
"    let g:clang_library_path='/usr/lib/llvm-10/lib'
"endif
"let g:clang_user_options='-std=c++17'

"---------------Input method-------------------"

"/
"/ rlue/vim-barbaric
"/

" The input method for Normal mode (as defined by `xkbswitch -g` or `ibus engine`)

if has('mac')
    let g:barbaric_default = 0
endif



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


"---------------functions-------------------"

pyx <<EOF
def renumber(start=0):
    import re
    for n in range(vim.current.range.start, vim.current.range.end+1):
        m = re.search(r'^[0-9a-fA-F]{4}(/(\d+))?', vim.current.buffer[n])
        if m:
            s = vim.current.buffer[n]
            s = s.replace(s[0:4], f'{start:04X}', 1)
            vim.current.buffer[n] = s
            start += 1 if m.group(2) is None else int(m.group(2))
EOF


"---------------auto load .vimrc-------------------"

"Enables the reading of .vimrc and .exrc in the current directory.
"set exrc
"shell and write commands are not allowed in
"set secure

