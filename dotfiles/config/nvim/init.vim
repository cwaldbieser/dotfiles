" Configure tab expansion to be 4 spaces.
set tabstop=4
set shiftwidth=4
set expandtab

" Python support
let g:python3_host_prog = '/home/waldbiec/.virtualenvs/neovim.3.10.env/bin/python'

" Plugin support.
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/')
" airline - status line enhancement
" Plug 'vim-airline/vim-airline'
" lualine
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'
" NERDcomment
Plug 'preservim/nerdcommenter'
" NERDtree - file manager
Plug 'preservim/nerdtree'
" vim-unimpared - shortcuts for paired operations like :lnext/:lprev
Plug 'tpope/vim-unimpaired'
" neoformat - code formatter
Plug 'sbdchd/neoformat'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git Fugitive
Plug 'tpope/vim-fugitive'
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'haishanh/night-owl.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim'
" Colorscheme switcher.
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
" Gitgutter
Plug 'airblade/vim-gitgutter'
" Easymotion
Plug 'easymotion/vim-easymotion'
" LSP client configuration.
Plug 'neovim/nvim-lspconfig'
" Completer coq-nvim
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Treesitter syntax highlighting
" To install a given languare-- :TSInstall <language_to_install>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Which key
Plug 'folke/which-key.nvim'

call plug#end()

" Neoformat
" Global settings.
let g:neoformat_run_all_formatters = 1
"let g:neoformat_enabled_yaml = ['prettier']
" Language-specific
" Set JSON indent level to 4.
let g:neoformat_json_jq = {
    \ 'exe': 'jq',
    \ 'stdin': 1,
    \ 'args': ['--indent', '4', '.']
    \ }
" SQL formatter
" https://sqlparse.readthedocs.io/en/latest/
let g:neoformat_sql_sqlformat = {
    \ 'exe': '/home/waldbiec/.local/bin/sqlformat',
    \ 'stdin': 1,
    \ 'args': ['--reindent', '--keywords', 'upper', '-'],
    \ }
" - Enabled formatters for Perl
let g:neoformat_perl_perltidy = {
    \ 'exe': 'perltidy',
    \ 'args': ['-q'],
    \ 'stdin': 1,
    \ }
let g:neoformat_typescript_prettier = {
    \ 'exe': 'npx',
    \ 'stdin': 1,
    \ 'args': ['-q', 'prettier', '--parser', 'typescript', '--tab-width', '4']
    \ }

" Add local node binaries to PATH.
if isdirectory($PWD .'/node_modules')
    let $PATH .= ':' . $PWD . '/node_modules/.bin'
endif

" Filetype detection
filetype plugin on

" Relative number
set rnu
set nu

" Remap CTRL-w to Leader-w.
nnoremap <Leader>w <C-w>

" Allow switching buffers when there are unsaved changes.
set hidden

" No highlighting all matching searches, please.
set nohls

" Mappings for working with terminal mode.
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
    tnoremap <C-v><Esc> <Esc>
    tnoremap <Leader><Esc> <Esc>
endif

if has('nvim')
    " Terminal mode:
    tnoremap <M-h> <c-\><c-n><c-w>h
    tnoremap <M-j> <c-\><c-n><c-w>j
    tnoremap <M-k> <c-\><c-n><c-w>k
    tnoremap <M-l> <c-\><c-n><c-w>l
    " Insert mode:
    inoremap <M-h> <Esc><c-w>h
    inoremap <M-j> <Esc><c-w>j
    inoremap <M-k> <Esc><c-w>k
    inoremap <M-l> <Esc><c-w>l
    " Visual mode:
    vnoremap <M-h> <Esc><c-w>h
    vnoremap <M-j> <Esc><c-w>j
    vnoremap <M-k> <Esc><c-w>k
    vnoremap <M-l> <Esc><c-w>l
    " Normal mode:
    nnoremap <M-h> <c-w>h
    nnoremap <M-j> <c-w>j
    nnoremap <M-k> <c-w>k
    nnoremap <M-l> <c-w>l
endif

" Cycle through buffers
:nnoremap <S-Tab> :bnext<CR>

" Fzf shortcut
nnoremap <Leader>f :Files<CR>

" Visual cues for my current position.
" - Make the current line number stand out from the relative line numbers.
hi CursorLineNR cterm=bold ctermbg=234 gui=bold guibg=#202020
" Toggle crosshairs.
nnoremap <f2> :set cursorcolumn! <bar> set cursorline! <CR>
"  Make spelling errors stand out even when row is highlighted.
hi SpellBad cterm=underline

" Toggle colorcolumn on/off.
nnoremap <f3> :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>
hi ColorColumn cterm=bold ctermbg=darkgrey gui=bold guibg=#202020

" Toggle termguicolors.
nnoremap <f4> :set termguicolors!<CR>

" Set color scheme.
if exists('+termguicolors')
    set termguicolors
    colorscheme night-owl
else
    set notermguicolors
    colorscheme industry
endif

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>"endif

" On my terminal, <s-f8> produces <f20>
nmap <f20> <s-f8>

" Map Neoformat to shortcuts.
nnoremap <f7> :Neoformat <CR>

" Map spellchecking toggle
nnoremap <f9> :setlocal spell! <CR>

" Remap jk to ESC
inoremap jk <esc>
" inoremap <esc> <nop>

" JavaScript customizations.
augroup myjsbindings
  autocmd! myjsbindings
  autocmd Filetype javascript set tabstop=2
  autocmd Filetype javascript set shiftwidth=2
augroup end

" RST customizations
augroup myrestructuredtext
  autocmd! myrestructuredtext
  autocmd Filetype rst colorscheme spaceduck
augroup end

" Allow syntax highlighting for embedded lua and Python.
let g:vimsyn_embed = 'lP'

" Lua configurations.
lua << EOF
require('user.keymaps')
require('user.completer')
require('user.lsp')
require('user.syntax')
require('user.lualine')
require('user.whichkey')
EOF
