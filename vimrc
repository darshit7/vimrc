" This file contails vim configurations for python full stack development
" environment.
" Package Manager used for different functionalities is Pathogen. You can
" download it from here https://github.com/tpope/vim-pathogen
" Below is the list of packages used.
" 1. NERDTree: git clone https://github.com/scrooloose/nerdtree
" 2. syntastic: git clone https://github.com/scrooloose/syntastic
" 3. vim-color-solarized: git clone https://github.com/altercation/vim-colors-solarized
" 4. vim-powerline: git clone https://github.com/lokaltog/vim-powerline
" 5. YouCompleteMe: git clone https://github.com/valloric/youcompleteme
" 6. pep8: git clone https://github.com/cburroughs/pep8.py
" 7. vim-better-whitespace: git clone https://github.com/ntpeters/vim-better-whitespace
" 8. vim-easymotion: git clone https://github.com/easymotion/vim-easymotion
"
" This site will helpfull check out available plugins for vim: http://vimawesome.com/

" Pathogen initialization.
execute pathogen#infect()

filetype plugin indent on

" enable syntax highlighting and python code checker
syntax on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['jslint']


"solaraized settings for color scheme
syntax enable
set background=dark
let g:solarized_termcolors = 256
let g:solarized_degrade = 1
let g:solarized_bold = 1
let g:solarized_italic = 1
let g:solarized_contrast = "high"
let g:solarized_visibility = 1
colorscheme solarized
call togglebg#map("<F5>")


" show line numbers
set number

"utf-8 support
set encoding=utf-8

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show verical line at 80 character
set colorcolumn=80

" show the matching part of the pair for [] {} and ()
set showmatch

"split area
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"enable folding
set foldmethod=indent
set foldlevel=99

"enable folding with the spacebar
nnoremap <space> za

"PEP8 support
let g:pep8_map='whatever'
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"fullstack development support
au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2


" Currently you can activate environement and run vim to use activated
" environment's packaged and python path.

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF


"remove bad spaces
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"NERD shourtcut ctrl+n
map <C-n> :NERDTreeToggle<CR>

"NERD settings
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"ingonre files in nerd tree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"powerline settings
set laststatus=2
let g:Powerline_symbols = 'fancy'

"Auto complete settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" easy motion settings to easy navigation in file
"<Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

"s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)

"search word in easy motion
map  <Leader>z <Plug>(easymotion-sn)
omap <Leader>z <Plug>(easymotion-tn)


"Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"white space color highlight
highlight ExtraWhitespace ctermbg=23
let g:better_whitespace_filetypes_blacklist=['.html']
