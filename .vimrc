" Assumes usage of vim-plug: https://github.com/junegunn/vim-plug
"
call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" SCSS Syntax Highlighting
Plug 'cakebaker/scss-syntax.vim'

" Minimap
Plug 'severin-lemaignan/vim-minimap'

" Zen Mode (Goyo)
Plug 'junegunn/goyo.vim'

" Limelight
Plug 'junegunn/limelight.vim'

" Vue syntax highlighting
" Plug 'posva/vim-vue'

" Language server protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Linting
Plug 'dense-analysis/ale'

" JavaScript syntax support
Plug 'pangloss/vim-javascript'

" TypeScript syntax support
Plug 'leafgarland/typescript-vim'

" Airline (nifty status line)
Plug 'vim-airline/vim-airline'

" Airline themes
Plug 'vim-airline/vim-airline-themes'

" Vue Component Syntax Highlighting
Plug 'storyn26383/vim-vue'

" Better spell checking
Plug 'kamykn/spelunker.vim'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

" Conquer of Completion (intellisense for vim)
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-tsserver']
hi Pmenu ctermbg=black ctermfg=green

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Tab to go to next buffer, Shift + Tab to go to previous.
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Allow usage of the mouse in normal mode.
set mouse=n

set number
set numberwidth=4
highlight LineNr ctermfg=darkgrey
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set colorcolumn=81,101
set background=dark
highlight MatchParen cterm=none ctermbg=black ctermfg=45
highlight Comment ctermfg=244
highlight ColorColumn ctermbg=black ctermfg=lightred
set viminfo+=<2000
syntax on
set hlsearch
highlight Visual ctermbg=black
highlight Search ctermbg=brown ctermfg=black
highlight SignColumn ctermbg=black
set cursorline
set updatetime=100

" Keep cursor in window center when scrolling.
set scrolloff=999

" Run :Explore by pressing \e in normal mode.
nnoremap <Leader>e :Explore
nnoremap <Leader>ee :Explore ~/dev/

" List buffers with \b in normal mode.
nnoremap <Leader>b :buffers

" Run :bd by pressing \d in normal mode.
nnoremap <Leader>d :bd

" Open the terminal by pressing \t in normal mode.
nnoremap <Leader>t :term

" Run :%s (search and replace)
nnoremap <Leader>s :%s/

" Yank block
nnoremap <Leader>y "+y

" Paste block
nnoremap <Leader>p "+p

" No highlight
nnoremap <Leader>n :noh

" Limelight
let g:limelight_conceal_ctermfg = 1

" ALE highlighting
set signcolumn=yes " Always display sign column
highlight ALEErrorSign ctermbg=black ctermfg=red
highlight ALEWarningSign ctermbg=black ctermfg=yellow
let g:ale_set_hightlights = 0
highlight ALEError ctermbg=black ctermfg=red
highlight ALEWarning ctermbg=black ctermfg=yellow
let g:ale_set_balloons = 1

" ALE completion
let g:ale_completion_enabled = 1
let b:ale_linters = {'javascript': ['eslint']}

" Shortcut to toggle ALE, helps resolve display issues quickly
" Pressing 'at' in normal mode will call ':ALEToggle'.
nnoremap lt :ALEToggle
nnoremap ll :ALELint
nnoremap lh :ALEHover

" Spelunker settings
let g:enable_spelunker_vim = 1
let g:spelunker_highlight_type = 1
let g:spelunker_disable_uri_checking = 1
let g:spelunker_disable_email_checking = 1
let g:spelunker_disable_acronym_checking = 1
highlight SpelunkerSpellBad cterm=underline ctermfg=yellow
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=yellow gui=underline guifg=NONE

set nowrap
sign define piet text=>> texthl=Search
" let g:netrw_browse_split = 4
" let g:netrw_winsize = 20
" set showtabline=2
set laststatus=2
" Ensure the terminal always splits to the bottom.
set splitright
set splitbelow
" set termsize=10x0

" Change cursor shape between insert and normal mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" Indent Guide settings
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 1
" let g:indent_guides_auto_colors = 0
" highlight IndentGuidesOdd ctermbg=black
" highlight IndentGuidesEven ctermbg=darkgrey

" Enable JSDoc highlighting
let g:javascript_plugin_jsdoc = 1

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
" Required for themes to work correctly
set t_Co=256
" let g:airline_theme = 'angr'
let g:airline_theme = 'luna'
" Override Comment highlight setting
highlight Comment ctermfg=244

" Airline fonts.  NOTE: If connected via SSH, patched fonts must be installed
" on the terminal application's host machine.
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

