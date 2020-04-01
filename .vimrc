"============================================"
"=====>         _                      <====="
"=====>  __   _(_)_ __ ___  _ __ ___   <====="
"=====>  \ \ / / | '_ ` _ \| '__/ __|  <====="
"=====>   \ v /| | | | | | | | | (__   <====="
"=====>    \_/ |_|_| |_| |_|_|  \___|  <====="
"=====>                                <====="
"============================================"
"============================================"
"
"
"
" Command Mode{
"
"	:PlugInstall            Installs all plugins
"	:PlugClean              Cleans removed plugins
"	:PlugUpdate             Updates plugins
"
"	:RainbowToggle          [vim-rainbow]--you can use it to toggle this plugin.
"	:RainbowLoad            [vim-rainbow]--you can use it to load/reload this plugin.
"
"	:NERDTree               Starts NERDTree
"	:set ft=i3config        Syntax highlighting for i3config file
"	:w!!                    saves file as root
"
" }
"
"
" Leader key{
"		t                   toggle NERDTree
"		f                   :FZF ~
"		v                   vertical split
"		h                   horizontal split
" }
"
"

:let mapleader = " "


"====================="
"====== plugins ======"
"====================="
"
" to install a plugin, add it with the 'Plug' command
" down below, then open vim and type ':PlugInstall'
"
" Plugins are added to the "plugged" folder under
" the "~/.vim" folder
"
" my "~/.vim" folder is a symlink to "~/.config/vim"
"


"if plug.vim isn't present, install automatically
"""https://github.com/junegunn/vim-plug

if ! filereadable(expand('~/.config/vim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/vim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/vim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif



call plug#begin()


"https://github.com/vim-airline/vim-airline
Plug 'bling/vim-airline'

"https://github.com/xuhdev/vim-latex-live-preview
Plug 'xuhdev/vim-latex-live-preview'

"https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

"https://github.com/PotatoesMaster/i3-vim-syntax
Plug 'PotatoesMaster/i3-vim-syntax'

"https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

"https://github.com/frazrepo/vim-rainbow
Plug 'frazrepo/vim-rainbow'

"https://github.com/junegunn/fzf
Plug 'junegunn/fzf'

"https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

"https://github.com/vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'

"https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'


""consider


call plug#end()

"===================="
"====== config ======"
"===================="

" not vi compatible
	set nocompatible

" set background (dark)
	set background=dark

" encoding
	set encoding=utf-8

" enable mouse
	set mouse=a

" Helps force plugins to load correctly when it is turned back on below
	filetype off
" For plug-ins to load correctly.
	filetype plugin indent on

" show current mode
	set showmode
" show command
	set showcmd

" syntax highlighting
	syntax on

" show matching brackets
	set showmatch

" Autoindent the code
	set autoindent



"""left-hand side numbers
" line numbers; set relative to current line
	set number
	set relativenumber
" set the color (magenta)
	:highlight LineNr ctermfg=magenta


" tab
	set tabstop=4
" when indenting with '>', use 4 spaces width
	set shiftwidth=4

" line wrapping
	set wrap

" Status bar
	set laststatus=2

" Modified buffers can be put in background
	set hidden


"""search
" do incremental searching
	set incsearch
" highlight searches
	set hlsearch
" Smart casing when searching (ignore case unless an uppercase is found)
	set ignorecase
	set smartcase


" Autostart NERDTree when vim starts
"	autocmd vimenter * NERDTree
" Autoclose NERDTree when file opens
	let NERDTreeQuitOnOpen=1
" Toggle NERDTree
	nnoremap <leader>t :NERDTreeToggle<CR>


"""splits
" Splits open bottom and right
	set splitbelow splitright
" Split Navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
" Split open shortcut
	nnoremap <leader>v :vsp<CR>
	nnoremap <leader>h :sp<CR>


" AutoDelete trailing whitespace
	autocmd BufWritePre * %s/\s\+$//e

" Auto recharge changed files
	set autoread

" Enable autocompletion:
	set wildmode=longest,list,full

" Don't use beep nor visual bell
	set visualbell t_vb=


" shortcut for :FZF ~
	nnoremap <leader>f :FZF ~/Documents<CR>

" shortcut for Syntastic
	nnoremap <leader>s :SyntasticCheck<CR>
	nnoremap <leader>d :SyntasticToggleMode<CR>
" recommended settings
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0

"fold
    set foldmethod=manual
    set nofoldenable



"========================================="
"====== Remapping ESC ---> CAPSLOCK ======"
"========================================="

au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"""https://stackoverflow.com/questions/2176532/how-to-map-caps-lock-key-in-vim"""


"=================================================="
"====== Save as SuperUser without |sudo vim| ======"
"=================================================="

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"""http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work"""



"======================="
"===== vim-rainbow ====="
"======================="

let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']



