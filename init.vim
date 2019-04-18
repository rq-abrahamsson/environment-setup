"
" Vim config
" Base created with https://www.lucasfcosta.com/2019/02/10/terminal-guide-2019.html
"
let g:python_host_prog = '/Users/robin.abrahamsson/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/robin.abrahamsson/.pyenv/versions/neovim3/bin/python'

imap jk <Esc>
nnoremap <C-P> :Files<CR>

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'

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
