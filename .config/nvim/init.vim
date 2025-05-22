" Configuration for Neovim

set background=dark
set cursorline
set hidden
set number
set relativenumber
set title
set wildmenu

set expandtab
set shiftwidth=4
set tabstop=4
set autoindent

filetype plugin on
syntax on

set t_Co=256o

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  
  Plug 'tjdevries/colorbuddy.vim'
  Plug 'tjdevries/gruvbuddy.nvim'

  Plug 'airblade/vim-gitgutter'

  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ap/vim-css-color'
  Plug 'preservim/nerdtree'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  
"  Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
  Plug 'plasticboy/vim-markdown'

  " Telekasten
  Plug 'nvim-lua/plenary.nvim'
  Plug 'BurntSushi/ripgrep'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make'  }
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'renerocksai/telekasten.nvim'
  Plug 'renerocksai/calendar-vim'

  " Distraction-free writing
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

call plug#end()

" Limelight settings
let g:limelight_default_coefficient = 0.7

autocmd! User GoyoEnter Limelight
autocmd! User Goyoleave Limelight!

let g:limelight_priority = -1

lua require('colorbuddy').colorscheme('gruvbuddy')

let g:gitgutter_terminal_reports_focus=0

lua require('Telekasten')
" lua require('Telekasten-keybindings')

let g:vim_markdown_folding_disabled = 1

" Telekasten Keybindings

nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
nnoremap <leader>zT :lua require('telekasten').goto_today()<CR>
nnoremap <leader>zW :lua require('telekasten').goto_thisweek()<CR>
nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
nnoremap <leader>zN :lua require('telekasten').new_templated_note()<CR>
nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
nnoremap <leader>zc :lua require('telekasten').show_calendar()<CR>
nnoremap <leader>zC :CalendarT<CR>
nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
nnoremap <leader>zF :lua require('telekasten').find_friends()<CR>
nnoremap <leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
nnoremap <leader>zm :lua require('telekasten').browse_media()<CR>
nnoremap <leader>za :lua require('telekasten').show_tags()<CR>
nnoremap <leader># :lua require('telekasten').show_tags()<CR>
nnoremap <leader>zr :lua require('telekasten').rename_note()<CR>

" on hesitation, bring up the panel
nnoremap <leader>z :lua require('telekasten').panel()<CR>

" we could define [[ in **insert mode** to call insert link
" inoremap [[ <cmd>:lua require('telekasten').insert_link()<CR>
" alternatively: leader [
inoremap <leader>[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
inoremap <leader>zt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>
inoremap <leader># <cmd>lua require('telekasten').show_tags({i = true})<cr>

" ----- the following are for syntax-coloring [[links]] and ==highlighted text==
" ----- (see the section about coloring in README.md)

" for gruvbox
hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
hi tkBrackets ctermfg=gray guifg=gray

" real yellow
hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold
" gruvbox
"hi tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold

hi link CalNavi CalRuler
hi tkTagSep ctermfg=gray guifg=gray
hi tkTag ctermfg=175 guifg=#d3869B


