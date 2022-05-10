" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'hashivim/vim-terraform'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()

" Ctrl-p and Ctrl-n to navigate opened tabs
map <C-p> gt
map <C-n> gT

colorscheme ir_black
set background=dark

set number                     " Show current line number
set relativenumber             " Show relative line numbers

" Leader
let mapleader = ','

" NerdTree Config
nnoremap <Leader>j :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in new tab, not another buff
let g:jedi#use_tabs_not_buffers = 1

" deoplete configs - is used for completions
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" terraform stuff
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" code checker 
let g:neomake_python_enabled_makers = ['pylama']
let g:neomake_python_pylama_maker = {
  \ 'args': [
  \ '-o', '~/code/ansible/setup.cfg'
  \ ]
  \ }
call neomake#configure#automake('w')

let g:neoformat_enabled_python = ['yapf']
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" nnoremap <silent> gd :call LanguageClient#textDocument_definition({
"     \ 'gotoCmd': 'tabnew',
"     \ })<CR>
