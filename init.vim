"
" __     _____ __  __ ____   ____ 
" \ \   / /_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |    
"   \ V /  | || |  | |  _ <| |___ 
"    \_/  |___|_|  |_|_| \_\\____|
"
"
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
set termguicolors
" set t_Co=256
set nocompatible

"set clipboard=unnamed
let &t_ut=''
set autochdir

" ===
" === Editor behavior
" ===
set number
" set relativenumber
set cursorline
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set formatoptions-=tc
set splitright
set splitbelow
set mouse=a
set noshowmode
set showcmd
" set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
exec "nohlsearch"
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
syntax enable
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo,.
endif

" Cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
"tnoremap <C-N> <C-\><C-N>:q<CR>


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
map ; :

" Save & quit
map Q :q<CR>
map S :w<CR>

" Open Startify
map <LEADER>st :Startify<CR>

" Copy to system clipboard
vnoremap Y :w !xsel -i -b<CR>

" Indentation
nnoremap < <<
nnoremap > >>


" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Adjacent duplicate words
map <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Folding
map <silent> <LEADER>o za

" ===
" === movement and fast keys
" ===
" 9 key: go to the start of the line
noremap <silent> 9 0
" 0 key: go to the end of the line
noremap <silent> 0 $

" Disabling the default s key
noremap s <nop>
noremap H I
noremap <silent> h i
noremap <silent> i k
noremap <silent> k j
noremap <silent> j h
noremap <silent> I 5k
noremap <silent> K 5j
noremap <silent> J 5h
noremap <silent> L 5l
" noremap <silent> H 5h
" noremap <silent> K 5k
" noremap <silent> J 5j
" noremap <silent> L 5l
noremap W 5w
noremap B 5b
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>
noremap <C-c> <ESC>
inoremap <C-c> <ESC>
" Ctrl + w close buffer
noremap <C-w> :bd!<CR>
noremap <F12> <C-w>
" Ctrl + j to select a word
nnoremap <C-j> viw
inoremap <C-j> <ESC>viw
" Shift+Tab to select string
nnoremap <S-Tab> F"vf"

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <F12>w
map <LEADER>i <F12>k
map <LEADER>k <F12>j
map <LEADER>j <F12>h
map <LEADER>l <F12>l
" Place the two screens up and down
noremap sh <F12>t<F12>K
" Place the two screens side by side
noremap sv <F12>t<F12>H

" Split window
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" ===
" === Tab management
" ===
map <F2> :bp<CR>
map <F3> :bn<CR>
map <LEADER><BS> :BufOnly!<CR>
" Create a new tab with tu
map tu :tabe<CR>
" Move around tabs with tn and ti
map tj :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmj :-tabmove<CR>
map tml :+tabmove<CR>"

" ===
" === Other useful stuff
" ===

" ===
" === My Snippets
" ===
source ~/.config/nvim/snippits.vim

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
map ` ~

" Opening a terminal window
map <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet

" Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" surround words with "
" inoremap <C-s> <ESC>hea"<ESC>hbi"<ESC>e
" nnoremap <C-s> hea"<ESC>hbi"<ESC>e
inoremap <C-s> <ESC>ciw""<ESC>F"p
nnoremap <C-s> ciw""<ESC>F"p
vnoremap <C-s> c""<ESC>F"p

" surround words with ()
inoremap <C-q> <ESC>ciw()<ESC>F(pF(i
nnoremap <C-q> ciw()<ESC>F(p
vnoremap <C-q> c()<ESC>F(pF(i

" Tabularize =
vnoremap <LEADER>= :Tabularize /=<CR>

" Compile function
map <C-b> :call CompileRunGcc()<CR>
imap <C-b> <ESC>:call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitright
    ":vsp
    ":vertical resize-10
    :sp
    " :term python3 %
    :term $HOME/.conda/envs/op/bin/python %
  elseif &filetype == 'html'
    exec "!google-chrome-stable % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc

map R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'crusoexia/vim-monokai'

" File navigation
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'chxuan/vim-replace'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'vim-scripts/BufOnly.vim'

" Error checking
"Plug 'w0rp/ale'

" Auto Complete
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-github'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-match-highlight'
" Plug 'ncm2/ncm2-markdown-subscope'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/vim-cursorword'
Plug 'mhinz/vim-startify'

" Git
" Plug 'rhysd/conflict-marker.vim'
" Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'dkarter/bullets.vim', { 'for' :['markdown', 'vim-plug'] }

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Bookmarks
" Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
"Plug 'yuttie/comfortable-motion.vim'
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'tmhedberg/SimpylFold'
"Plug 'vim-scripts/restore_view.vim'
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'ryanoasis/vim-devicons'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

call plug#end()

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file = 0
    silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" ===
" === Dress up my vim
" ===
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" ===
" === Airline
" ===
let g:airline_theme='dark'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_mode_map = {
      " \ '__' : '-',
      " \ 'n'  : 'NOR',
      " \ 'i'  : 'INS',
      " \ 'R'  : 'RPL',
      " \ 'c'  : 'CMD',
      " \ 'v'  : 'VIS',
      " \ 'V'  : 'VLI',
      " \ '' : 'VBL',
      " \ 's'  : 'S',
      " \ 'S'  : 'S',
      " \ '' : 'S',
      " \ }

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" vim-replace
" press rr to replace current word with clipboard
" press space+R to replace all
nnoremap <leader>R :ReplaceTo<space>

" " ===
" " === NERDTree
" " ===
" map tt :NERDTreeToggle<CR>
" let NERDTreeMapOpenExpl = ""
" let NERDTreeMapUpdir = "N"
" let NERDTreeMapUpdirKeepOpen = "n"
" let NERDTreeMapOpenSplit = ""
" let NERDTreeMapOpenVSplit = "I"
" let NERDTreeMapActivateNode = "i"
" let NERDTreeMapOpenInTab = "o"
" let NERDTreeMapOpenInTabSilent = "O"
" let NERDTreeMapPreview = ""
" let NERDTreeMapCloseDir = ""
" let NERDTreeMapChangeRoot = "l"
" let NERDTreeMapMenu = ","
" let NERDTreeMapToggleHidden = "zh"
"
"
" " ==
" " == NERDTree-git
" " ==
" let g:NERDTreeIndicatorMapCustom = {
    " \ "Modified"  : "✹",
    " \ "Staged"    : "✚",
    " \ "Untracked" : "✭",
    " \ "Renamed"   : "➜",
    " \ "Unmerged"  : "═",
    " \ "Deleted"   : "✖",
    " \ "Dirty"     : "✗",
    " \ "Clean"     : "✔︎",
    " \ "Unknown"   : "?"
    " \ }

" " ===
" " === NCM2
" " ===
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" let ncm2#popup_delay = 5
" let g:ncm2#matcher = "substrfuzzy"
" let g:ncm2_jedi#python_version = 3
" let g:ncm2#match_highlight = 'mono-space'


"let g:jedi#auto_initialization = 1
""let g:jedi#completion_enabled = 0
""let g:jedi#auto_vim_configuration = 0
""let g:jedi#smart_auto_mapping = 0
"let g:jedi#popup_on_dot = 1
"let g:jedi#completion_command = ""
"let g:jedi#show_call_signatures = "1"


" Some testing features
" set shortmess+=c
" set notimeout

" ===
" === coc
" ===
" fix the most annoying bug that coc has
silent! au BufEnter * silent! unmap if
set hidden
set updatetime=100
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
"au TextChangedI * GitGutter
" Installing plugins
let g:coc_global_extensions = ['coc-word', 'coc-java', 'coc-highlight', 'coc-texlab', 'coc-python', 'coc-vimlsp', 'coc-snippets', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-clangd']
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" <c-l> to trigger completion
inoremap <silent><expr> <C-l> coc#refresh()
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Useful commands
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nmap <F6> <Plug>(coc-rename)
nmap <LEADER>S :CocDisable<CR>
" Use <LEADER>+h to show documentation in preview window.
nnoremap <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" " ===
" " === vim-indent-guide
" " ===
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 1
" silent! unmap <LEADER>ig
" autocmd WinEnter * silent! unmap <LEADER>ig
" hi IndentGuidesOdd  ctermbg=darkgrey
" hi IndentGuidesEven ctermbg=darkgrey

" ===
" === indentLine
" ===
let g:indentLine_char = '│'
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#333333'
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" ===
" === Python-syntax
" ===
" let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === FZF
" ===
map <C-p> :FZF<CR>


" " ===
" " === vim-signature
" " ===
" let g:SignatureMap = {
        " \ 'Leader'             :  "m",
        " \ 'PlaceNextMark'      :  "m,",
        " \ 'ToggleMarkAtLine'   :  "m.",
        " \ 'PurgeMarksAtLine'   :  "dm-",
        " \ 'DeleteMark'         :  "dm",
        " \ 'PurgeMarks'         :  "dm/",
        " \ 'PurgeMarkers'       :  "dm?",
        " \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        " \ 'GotoPrevLineAlpha'  :  "",
        " \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        " \ 'GotoPrevSpotAlpha'  :  "",
        " \ 'GotoNextLineByPos'  :  "",
        " \ 'GotoPrevLineByPos'  :  "",
        " \ 'GotoNextSpotByPos'  :  "mn",
        " \ 'GotoPrevSpotByPos'  :  "mp",
        " \ 'GotoNextMarker'     :  "",
        " \ 'GotoPrevMarker'     :  "",
        " \ 'GotoNextMarkerAny'  :  "",
        " \ 'GotoPrevMarkerAny'  :  "",
        " \ 'ListLocalMarks'     :  "m/",
        " \ 'ListLocalMarkers'   :  "m?"
        " \ }

" ===
" === Undotree
" ===
map <LEADER>L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1


" ===
" === nerdcommenter
" ===
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = 'n'
let g:multi_cursor_select_all_word_key = '<LEADER>a'
let g:multi_cursor_start_key           = 'gn'
let g:multi_cursor_select_all_key      = 'g<LEADER>a'
let g:multi_cursor_next_key            = 'n'
let g:multi_cursor_prev_key            = 'm'
let g:multi_cursor_skip_key            = ','
let g:multi_cursor_quit_key            = '<Esc>'


" ==
" == thesaurus_query
" ==
map <LEADER>th :ThesaurusQueryLookupCurrentWord<CR>


" comfortable-motion
"nnoremap <silent> <C-e> :call comfortable_motion#flick(50)<CR>
"nnoremap <silent> <C-u> :call comfortable_motion#flick(-50)<CR>
"let g:comfortable_motion_no_default_key_mappings = 1
"let g:comfortable_motion_interval = 1


" Startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" Far.vim
nnoremap <silent> <LEADER>f :F  %<left><left>

" ===
" === emmet
" ===
let g:user_emmet_leader_key='<C-f>'

" ===
" === Bullets.vim
" ===
let g:bullets_set_mappings = 0

" VIM-RANGER
let g:ranger_map_keys = 0
map tt :Ranger<CR>

" VIM-JSON compatible
let g:vim_json_syntax_conceal = 0

" VIM-signify
let g:signify_skip = {'vcs': { 'allow': ['git'] }}

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
  exec "e ~/.config/nvim/_machine_specific.vim"
endif
