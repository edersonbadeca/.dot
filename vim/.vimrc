
if !&diff
    syntax off
endif

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/git-nerdtree'
"Plug 'ervandew/supertab'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'kshenoy/vim-signature' " Show marks in the status line
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plugin para Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'charlespascoe/vim-go-syntax'
Plug 'olexsmir/gopher.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'mfussenegger/nvim-fzy'
Plug 'williamboman/mason.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
"Plug 'Exafunction/codeium.vim'
" add github copilot plugin
Plug 'github/copilot.vim'
Plug 'preservim/tagbar'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
Plug 'preservim/tagbar'
Plug 'easymotion/vim-easymotion'
" Terraform stuff
Plug 'hashivim/vim-terraform'

Plug 'folke/which-key.nvim' " show vim commands
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'yasuhiroki/github-actions-yaml.vim'
Plug 'tpope/vim-fugitive'
Plug 'codeindulgence/vim-tig'
Plug 'tpope/vim-dotenv'

" Plugin base do GitHub Copilot (necessário pro chat)
Plug 'zbirenbaum/copilot.lua'

" Dependência necessária

" Plugin do chat (branch canary)
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

Plug 'mtdl9/vim-log-highlighting' " Plugin para destacar logs


call plug#end()

filetype plugin indent on     " required!

set t_Co=256

set background=dark

set hlsearch  " Hilight searches by default
set magic " Set magic on, for regular expressions
set wildmode=longest,full " Complete longest common string, then each full match
set wildmenu
set ignorecase
set smartcase
set history=1000
set ff=unix
set encoding=utf-8
set fileencoding=utf-8
set autoread  " Automatically reread files that have been changed externally
set backspace=indent,eol,start
set hidden    " Switch buffers even if the current one have unsaved changes
set nu
set noswapfile
set expandtab
set clipboard=unnamed "Uses clipboard when you yank
set cpt-=t
let base16colorspace=256  " Access colors present in 256 colorspace

" show autocomplete menu on typing
set completeopt=

"Change lead to comma
let mapleader=","

" Plugin Configuration
" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

let g:Powerline_symbols='fancy'
let g:pymode_lint=1
let g:pymode_lint_cwindow=0
let g:pymode_lint_signs=1
let g:pymode_lint_message=1
let g:pymode_lint_on_write=0
let g:pymode_breakpoint=1
let g:pymode_breakpoint_cmd='import ipdb; ipdb.set_trace()'
let g:pymode_folding=1
let g:pymode_motion=1
let g:pymode_doc=1
let g:pymode_rope_completion=0
let g:pymode_rope=0
let g:pymode_options_max_line_length=210
let g:jedi#popup_on_dot=0
let g:pymode_lint_checkers=['pep8']
let g:pymode_python = 'python3'

let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_virtualenv=1
let NERDTreeShowHidden=1


" Configuração do COC para autocompletar
let g:coc_global_extensions = ['coc-go']


"Colors schemas
"colorscheme badwolf
colorscheme base16-gruvbox-dark-hard
"colorscheme dracula


"Javascript
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab

""Ruby vim config
"let g:ruby_indent_block_style = 'expression'
"let g:ruby_indent_block_style = 'do'

" Auto save files when focus is lost
au FocusLost * silent! wa
set autowriteall

" Set a POSIX shell
set shell=bash


" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e


nnoremap <leader>A :Commands<CR>
nnoremap <leader>a :Telescope<CR>
nnoremap <leader>p :History<CR>
nnoremap <leader>e :Buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>l :s/, /,\r/g<CR>


" Habilitar formatação automática com goimports ao salvar arquivos Go
let g:go_fmt_command = "goimports"
" autocmd BufWritePre *.go :GoFmt

" mapas para o debug do go
nmap <leader>di :GoDebugStart<CR>
nmap <leader>dc :GoDebugContinue<CR>
nmap <leader>dn :GoDebugNext<CR>
nmap <leader>ds :GoDebugStep<CR>
nmap <leader>db :GoDebugBreakpoint<CR>

" configs do vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

" Configuração do golangci-lint
let g:go_metalinter_command = "golangci-lint run"


let g:go_gopls_enabled = 1
let g:go_template_use_pkg = 1
let g:go_template_file = '~/.vim/templates/go_function_template.go'




" Map Ctrl+<movement> to move around windows.
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Favorite split window
map vv <c-w>v
map ss <c-w>s
map L ~

" For vimDiff
map ] ]c
map [ [c


" NerdTree
map <leader>n :NERDTreeFocus<CR>

"noremap <leader>d Oeval(\Psy\sh());<ESC> :w <CR>
"nnoremap <leader>p Obinding.pry <ESC> :w <CR>
"nnoremap <leader>I Orequire IEx; IEx.pry <ESC> :w <CR>

" tab navigation
nnoremap gT :bp<CR>
nnoremap gt :bn<CR>
nnoremap H :b#<CR>
nnoremap dd dd<ESC> :w <CR>
nnoremap tt :bd!<CR>
nnoremap <c-q> :bd!<CR>

"do not expand time with esc

" Resize split
nnoremap <leader>h :vertical resize +15<cr>
" Resize split
noremap <leader>k :vertical resize -15<cr>

nnoremap <Leader>y :PymodeLintAuto<CR>
nnoremap <Leader>yg :PymodeLint<CR>
nnoremap <Leader>yr gg=G<CR>
nnoremap <Leader>c :nohlsearch<CR>
nnoremap <Leader>x :file<CR>
nnoremap <Leader>t :let g:pymode_python='python'<CR>
nnoremap <leader>is :<c-u>ImpSort!<cr>
nnoremap <leader><space> :Telescope<CR>
inoremap <C-n>:<Down>


nnoremap <c-s> :w<CR>
inoremap jj <ESC> :w<CR>
inoremap kj <ESC> :w<CR>
nnoremap <leader>f :e $MYVIMRC<CR>
nnoremap <leader>ff :so $MYVIMRC<CR>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" My custom
nnoremap <space> w

" toogle scroll bind
" nmap <F5> :windo set scrollbind!<CR>

" Close all buffers
nnoremap !! :bufdo bd<CR>
" Close all buffers but only
nnoremap <c-!> :call Close()<CR>
"nnoremap <F8> Odlv debug <ESC> :w <CR>

" Copilot
"imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
"let g:copilot_no_tab_map = v:true



" Easy Usage
set pastetoggle=<leader>z

" Powerline setup
set laststatus=6

" NERD Tree setup
" F2 to toggle the tree view
nnoremap <leader>m :NERDTreeToggle<CR>
" nnoremap <leader>n :NERDTreeFind<CR>
" nnoremap <leader>t :TerraformFmt<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '^__pycache__$']

set wildignore+=*.o,*.pyc,*.swp,*.swo,*.py~
set wildignore+=*/tmp/*                                     " ctrlp - ignore files in tmp directories
set wildignore+=*/target/*                                  " ctrlp - ignore files in target directories
set wildignore+=*/build/*                                   " ctrlp - ignore gradle build directories
set wildignore+=*.so                                        " ctrlp - ignore .so files
set wildignore+=*.o                                         " ctrlp - ignore .o files
set wildignore+=*.class                                     " ctrlp - ignore .class files
set wildignore+=*.swp                                       " ctrlp - ignore .swp files
set wildignore+=*.zip                                       " ctrlp - ignore .zip files
set wildignore+=*.pdf                                       " ctrlp - ignore .pdf files
set wildignore+=*/node_modules/*                            " ctrlp - ignore node modules
set wildignore+=*/bower_components/*                        " ctrlp - ignore bower components
set wildignore+=*/dist/*                                    " ctrlp - ignore grunt build directory

let g:ctrlp_by_filename = 0                                 " ctrlp - don't search by filename by default (use full path instead)
let g:ctrlp_show_hidden = 1                                 " ctrlp - search for hidden files
let g:ctrlp_regexp = 1                                      " ctrlp - use regexp matching
let g:ctrlp_root_markers = ['pom.xml', 'Config', 'Gruntfile.js', 'package.json', 'build.gradle', '.bashrc']

" NERDCommenter
" For some reason, Vim sees Ctrl+/ as Ctrl+_
map <C-_> <plug>NERDCommenterToggle
" Refresh the tree view

nnoremap <leader>r :NERDTreeRefresh<CR>


" Close quickfix window
nnoremap <C-x> :cclose<CR>

" telescope show mappings
nnoremap <C-o> :Telescope keymaps<CR>


" Tagbar setup
nnoremap <silent> <leader>o :TagbarToggle<CR>
nnoremap <silent> <leader><leader> :Buffers<CR>
let tagbar_left=0
let tagbar_autoclose=1
let tagbar_autofocus=1
let tagbar_sort=0

" vim-airline
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='simple'


" fzf maps
nnoremap <silent> <c-p> :Telescope find_files<CR>

highlight LineNr ctermfg=darkgrey ctermbg=None


" VimInspector
" let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <Leader>ds :call vimspector#Stop()<CR>
nnoremap <c-Space> :Telescope lsp_references<CR>
nnoremap <c-e> :Buffers<CR>
nnoremap <c-f> :Telescope live_grep<CR>
vmap <c-f> :Telescope live_grep<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver


" JSON UTILS
"nnoremap <silent> <c-x> :execute '%!python -m json.tool' | w<CR>


" Syntatic
let g:syntastic_python_pylint_post_args='--disable C0301,C0111,C0103,F0401,I0011,R0201,R0801,R0902,R0903,R0904,R0913,R0914,E1002,E1101,E0611,W0142,W0212,W0232,W0401,unused-argument'

" au VimEnter *  NERDTree

" my functions
" Close all buffers but only
fu! FindDuplicate()
  :sort
  :g/^\(.*\)$\n\1$/p
:endfunction

fu! Close()
  :%bd|e#
:endfunction

function! AgWithIgnore()
    execute '!ag --ignore-dir="node_modules"'
endfunction

" Map a key combination to call the custom Ag function
nnoremap <leader>ag :call AgWithIgnore()<CR>


"ALEFix
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_fix_on_save = 0
let g:ale_completion_autoimport = 1
let g:ale_javascript_standard_executable = 'standard'
let g:ale_completion_autoimport = 0
let g:airline_extensions_ale = 1

" git-fugitive
nnoremap <silent> <F9> :G log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue<>%an>%Creset')'<CR>
nnoremap <F2> :G status<CR>


" Oldfiles
nmap <c-i> <Plug>(Oldfiles)

" Close quickfix on select
augroup oldfiles
    autocmd!
    autocmd FileType qf if get(w:, 'quickfix_title') =~# 'Oldfiles' | nnoremap <buffer> <CR> <CR>:cclose<CR> | endif
augroup END

" shell integration
set shell=zsh
syntax on
set autoread


" Configure the vim-terraform plugin for auto-completion
autocmd FileType terraform setlocal omnifunc=terraformcomplete#Complete
autocmd Filetype terraform setlocal ts=2 sw=2 expandtab
autocmd Filetype tf setlocal ts=2 sw=2 expandtab
autocmd Filetype hcl setlocal ts=2 sw=2 expandtab
autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab


let g:terraform_fold_sections = 0
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1



" build in autocomplete
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <CR> pumvisible() ? "\<CR>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-j>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-k>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-j>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-j>" : "\<PageUp>"
set completeopt+=longest
set guifont=0xProtoNerdFont-Regular:h9



" Atalhos básicos para navegação rápida do easymotion
nmap <leader>w <Plug>(easymotion-w)
nmap <leader>l <Plug>(easymotion-lineforward)
nmap <leader>j <Plug>(easymotion-linebackward)
nmap <leader>f <Plug>(easymotion-overwin-f)


" Redefine o destaque do EasyMotionShade para não alterar o texto
highlight EasyMotionShade guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE

" Linka o EasyMotionShade ao grupo Normal
highlight link EasyMotionShade Normal




" Mapeia Ctrl+g seguido de uma letra para ir para a marca correspondente
function! GotoMark()
  let l:char = nr2char(getchar())
  execute "normal! `".l:char
endfunction
nnoremap <C-g> :call GotoMark()<CR>

" Use a seta para baixo para completar o próximo item na lista de autocompletar
inoremap <Down> <C-n>
" Use a seta para cima para completar o item anterior na lista de autocompletar
inoremap <Up> <C-p>

" let g:ycm_language_server = [
"   \ {
"   \   'name': 'terraform',
"   \   'filetypes': [ 'terraform' ],
"   \   'cmdline': [ '/usr/local/bin/terraform-ls' ],
"   \   'project_root_files': [ '.terraform' ],
"   \   'options': { 'initialization_options': {} },
"   \ },
" \ ]

