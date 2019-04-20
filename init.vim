"
" Vim config
"

let g:python_host_prog = '/Users/robin.abrahamsson/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/robin.abrahamsson/.pyenv/versions/neovim3/bin/python'

" Remap keys {{{
let mapleader="," " leader is comma
" jk is escape
inoremap jk <Esc>
nnoremap <C-P> :Files<CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" open ag.vim
nnoremap <leader>a :Ag
" }}}


syntax enable " enable syntax processing
" tabs {{{
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
" }}}
set number " show line number on current row
set relativenumber " show relative line numbers
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches


call plug#begin('~/.local/share/nvim/plugged')
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'

" Colorscheme {{{
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
" }}}
"
" JavaScript
Plug 'ternjs/tern_for_vim'

" semantic-based completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'pangloss/vim-javascript'

" Fuzzy search file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Language / Formatting
Plug 'mattn/emmet-vim'

call plug#end()

colorscheme badwolf

" NERDTree on ctrl+n
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1


" make FZF respect gitignore if `ag` is installed
" you will obviously need to install `ag` for this to work
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" disable auto_triggering ycm suggestions pane and instead
" use semantic completion only on Ctrl+n
let ycm_trigger_key = '<C-n>'
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = ycm_trigger_key

" this is some arcane magic to allow cycling through the YCM options
" with the same key that opened it.
" See http://vim.wikia.com/wiki/Improve_completion_popup_menu for more info.
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;
