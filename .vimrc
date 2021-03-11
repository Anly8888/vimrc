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

"set clipboard=unnamed               "default clipboard uses "+

" Enable OS mouse clicking and scrolling
"
" Note for Mac OS X: Requires SIMBL and MouseTerm
"
" http://www.culater.net/software/SIMBL/SIMBL.php
" https://bitheap.org/mouseterm/
" if has("mouse")
"     set mouse=a
" endif

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

" Plantuml
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

" easy align
Plug 'junegunn/vim-easy-align'

" QML
Plug 'peterhoeg/vim-qml'

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

" Vim Outliner of Markups
Plug 'vim-voom/VOoM'

" Conquer Of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" Sort selected lines by length
vmap <leader>sn ! awk '{ print length(), $0 \| "sort -n \| cut -d\\\  -f2-"}'<cr>

" fasd -d
command! -nargs=* Z :execute 'cd ' . system('fasd -1 -d <args>') . ''

" <tab> accepts completion
inoremap <TAB> <C-R>=pumvisible() ? "\<lt>C-Y>" : "\<lt>CR>"<CR>


"---------------Plugins-------------------"

"/
"/ fzf
"/

nmap <c-p> :FZF<cr>

"/
"/ greplace
"/
set grepprg=rg
let g:grep_cmd_opts = '-nH'


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
"/ fugitive
"/

command Gpom Git push origin HEAD:refs/for/master

"/
"/ Man
"/

let g:ft_man_open_mode = 'vert'

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


"---------------Conquer Of Completion-------------------"

"/
"/ coc: Conquer Of Completion
"/
"/ run command
"/  :CocInstall coc-xxx
"/ to install coc extensions
"/
"/ ref: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
"/

"/
"/ CocInstall coc-tsserver
"/


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

py3 <<EOF
# 自动按HEX重新排列序号, 用于rst文档表格
def renumber(start=None):
    import re
    start_line = vim.current.range.start
    end_line = vim.current.range.end + 1
    if start_line + 1 == end_line:
        for n in range(start_line, -1, -1):
            if re.match(r'^(\s|=)+$', vim.current.buffer[n]):
                break
        start_line = n
        for n in range(end_line, len(vim.current.buffer)):
            if re.match(r'^(\s|=)+$', vim.current.buffer[n]):
                break
        end_line = n
    for n in range(start_line, end_line):
        m = re.search(r'^([0-9a-fA-F]{4})(/(\d+))?', vim.current.buffer[n])
        if m:
            s = vim.current.buffer[n]
            if start is None:
                start = int(m.group(1), 16)
            else:
                s = s.replace(s[0:4], f'{start:04X}', 1)
                vim.current.buffer[n] = s
            start += 1 if m.group(3) is None else int(m.group(3))
        n += 1
    print(f'{start_line+1}-{end_line+1} {end_line-start_line} lines processed')
EOF
command! -nargs=? -range Renumber :<line1>,<line2>py3 renumber(<args>)


"---------------auto load .vimrc-------------------"

"Enables the reading of .vimrc and .exrc in the current directory.
"set exrc
"shell and write commands are not allowed in
"set secure

