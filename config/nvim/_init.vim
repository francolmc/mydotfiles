set number
set encoding=UTF-8

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set statusline+=%F

call plug#begin("~/.vim/plugged")
	" Plugin Section
	" Plug 'dracula/vim'
	Plug 'sonph/onehalf', {'rtp': 'vim/'}
	Plug 'scrooloose/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	" Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'airblade/vim-gitgutter'
	Plug 'kyazdani42/nvim-web-devicons'
	" Plug 'tibabit/vim-templates'
call plug#end()

" Config Section
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
" colorscheme dracula
colorscheme onehalfdark
let g:airline_theme='onehalfdark'


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" nnoremap <C-p> :FZF<CR>
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-s': 'split',
"   \ 'ctrl-v': 'vsplit'
"   \}

let g:LanguageClient_serverCommands = {
    \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
    \ }

nmap <C-P> :Telescope git_files hidden=true <CR>
nmap <C-T> :Telescope live_grep <CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)

nmap <Leader>t :CommentToggle<cr>
nmap <Leader>t :CommentToggle<cr>


" let g:tmpl_search_paths = ['~/.vim/templates']

"nnoremap FF :CocCommand eslint.executeAutofix<Enter>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> qf <Plug>(coc-fix-current)


" autocmd BufNewFile  test_*.py 0r ~/.config/nvim/snippets/unittest.py
autocmd BufNewFile  *.html 0r ~/.config/nvim/snippets/html5.html
autocmd BufNewFile *.controller.ts 0r ~/.config/nvim/snippets/controller.ts
autocmd BufNewFile *.entity.ts 0r ~/.config/nvim/snippets/entity.ts
