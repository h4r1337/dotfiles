call plug#begin('~/.vim/plugged')
	" Theme
	Plug 'dracula/vim'
	Plug 'tanvirtin/monokai.nvim'

	" Appearance
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'bling/vim-bufferline'
	
	" Utilities
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'ap/vim-css-color'
	Plug 'preservim/nerdtree'
	Plug 'preservim/nerdcommenter'
	Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
	Plug 'elzr/vim-json'
	
	" Completioni / linters / formatters
	Plug 'plasticboy/vim-markdown'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Git
	Plug 'tpope/vim-fugitive'

call plug#end()

" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse+=a
set number
set splitbelow splitright
set title
set wildmenu
set wildmode=longest,list
set showmatch
set ignorecase
set autoindent
set ttyfast
set ls=2
set showmode
set showcmd
set modeline
set ruler
set encoding=UTF-8

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2
set expandtab

filetype plugin indent on
syntax on
set t_Co=256

if $TERM !=? 'xterm-256color'
	set termguicolors
endif

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Make backspace a bit nicer
set backspace=eol,start,indent

colorscheme monokai

" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Airline
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

let b:coc_suggest_enable = 1

" Nerd tree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>

" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']


" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

 " move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" run current file
nnoremap <leader>r :!%:p

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
function! OpenTerminal()
  split term://fish
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
