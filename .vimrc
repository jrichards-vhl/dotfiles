"
" Assumes usage of vim-plug: https://github.com/junegunn/vim-plug
"
call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'

" SCSS Syntax Highlighting
Plug 'cakebaker/scss-syntax.vim'

" Minimap
Plug 'severin-lemaignan/vim-minimap'

" Vue syntax highlighting
Plug 'posva/vim-vue'

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

set number
" set numberwidth=3
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set colorcolumn=81,101
highlight ColorColumn ctermbg=black ctermfg=lightred
set viminfo+=<2000
syntax on
set hlsearch
highlight Visual ctermbg=black
highlight Search ctermbg=brown ctermfg=black
highlight SignColumn ctermbg=black
set cursorline

" Run :Explore by pressing ex in normal mode
nnoremap ex :Explore

nnoremap ee :e ~/dev/

" Run :%s (search and replace)
nnoremap sr :%s/

" ALE highlighting
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
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

set nowrap
sign define piet text=>> texthl=Search
" let g:netrw_browse_split = 4
" let g:netrw_winsize = 20
" set showtabline=2
set laststatus=2
" Ensure the terminal always splits to the bottom.
set splitbelow
set termsize=10x0

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


" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
" Required for themes to work correctly
set t_Co=256
let g:airline_theme = 'angr'
" Airline fonts.  NOTE: If connected via SSH, patched fonts must be installed
" on the terminal application's host machine.
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

