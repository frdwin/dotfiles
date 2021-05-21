"todo: compatibilizar o coc-snippets com o ultisnips

"baixa o vim-plug se não estiver instalado
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif

"plugins
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'unblevable/quick-scope'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"configurações gerais
syntax enable
set path+=**
set wildmenu
set ignorecase
set nobackup
set nowritebackup
set shortmess+=c
set hidden
set encoding=utf-8
set fileencoding=utf-8
set pumheight=10
set cmdheight=2
set number
set relativenumber
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set splitbelow
set splitright
set t_Co=256
set smartindent
set autoindent
set laststatus=0
set cursorline
set background=dark
set noshowmode
set updatetime=300
set timeoutlen=500
set formatoptions-=cro
set clipboard=unnamedplus
set autochdir
colorscheme dracula
set termguicolors
set mouse=nv

"líder
let mapleader = "\<space>"

"navegação
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <up> :resize +5<CR>
nnoremap <down> :resize -5<CR>
nnoremap <left> :vertical resize -5<CR>
nnoremap <right> :vertical resize +5<CR>
nnoremap <tab> :bn<cr>
nnoremap <s-tab> :bp<cr>
nnoremap <leader>q :bd<cr>
inoremap jk <Esc>
inoremap kj <Esc>
nmap ; :
vmap ; :

"arquivo de configuração
nnoremap <leader>ev :edit ~/.config/nvim/init.vim<cr>

"salva com ctrl+s
nnoremap <C-s> :w<CR>

"colar da última cópia
nnoremap ,p "0p
nnoremap ,P "0P

"startify
nnoremap <leader>s :Startify<cr>

"carrega o arquivo na mesma linha em que fechou
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

"carrega o arquivo de configuração ao salvar
autocmd! bufwritepost init.vim source %

"cancela o destaque da busca
nnoremap <silent> <leader>l :nohl<CR>

"coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent><nowait> <leader>d :CocDiagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')

"enter para selecionar primeiro completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"explorer
nmap <leader>z :CocCommand explorer --quit-on-open --position right<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
let g:coc_explorer_global_presets = {
\   'home': {
\     'root-uri': '~',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

"vim-go
autocmd FileType go nmap <buffer> <leader>r <plug>(go-run)
autocmd FileType go nmap <buffer> <leader>b <plug>(go-build)
autocmd FileType go nmap <buffer> <leader>t <plug>(go-test)
autocmd FileType go nmap <buffer> <leader>i <plug>(go-info)
autocmd FileType go nmap <buffer> <leader>l <plug>(go-lint)
autocmd FileType go vmap <buffer> gp :GoPlay<cr>
set autowrite
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
"let g:go_auto_sameids = 1
"let g:go_auto_type_info = 1
let g:go_def_mapping_enable=0

"file fuzzer and manager
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

"commentary.vim
nnoremap <c-_> gcc

"goyo+limelight
nnoremap <leader>g :Goyo<cr>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'

"tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary gui=underline ctermfg=10 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary gui=underline ctermfg=9 cterm=underline
augroup END

"startify
let g:startify_custom_header = [
	\ '  o888o                   oooo              ',
	\ 'o888oo oo oooooo     ooooo888 oooo  o  oooo ',
	\ ' 888    888    888 888    888  888 888 888  ',
	\ ' 888    888        888    888   888888888   ',
	\ 'o888o  o888o         88ooo888o   88   88    ',
	\ ]
let g:startify_lists = [
	\ { 'type': 'files',     'header': ['   Files']            },
	\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ ]
let g:startify_bookmarks = [
	\ { 'i': '~/.config/nvim/init.vim' },
	\ { 'b': '~/.bashrc' },
	\ { 'g': '~/snap/exercism/5/exercism/go/' },
	\ ]
let g:startify_session_dir = '~/.config/nvim/session'
