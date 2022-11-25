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
Plug 'vim-airline/vim-airline'
" NERDcomment
Plug 'preservim/nerdcommenter'
" NERDtree - file manager
Plug 'preservim/nerdtree'
" Neomake - for code linting
Plug 'neomake/neomake'
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

call plug#end()

" Neomake
" let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_python_enabled_makers = ['flake8']
" - When writing a buffer (no delay), and on normal mode changes (after
"   750ms).
call neomake#configure#automake('nw', 750)
" Open the locallist / quickfix list when errors/warnings detected.
let g:neomake_open_list=2
" - Use a specifc python with flake8 installed.
let g:neomake_python_flake8_maker = {
  \ 'exe': '/home/waldbiec/.local/bin/flake8',
  \ 'args': ['--format=default', '--max-line-length', '95', '--extend-ignore=E203,E501', '--select=C,E,F,W,B,B950'],
  \ 'errorformat':
      \ '%E%f:%l: could not compile,%-Z%p^,' .
      \ '%A%f:%l:%c: %t%n %m,' .
      \ '%A%f:%l: %t%n %m,' .
      \ '%-G%.%#',
  \ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess')
  \ }

" Neoformat
" Global settings.
let g:neoformat_run_all_formatters = 1
"let g:neoformat_enabled_yaml = ['prettier']
" Language-specific
let g:neoformat_python_black = {
    \ 'exe': '/home/waldbiec/.local/bin/black',
    \ 'stdin': 1,
    \ 'args': ['-q', '-']
    \ }
let g:neoformat_python_isort = {
    \ 'exe': '/home/waldbiec/.local/bin/isort',
    \ 'stdin': 1,
    \ 'args': ['-', '--quiet']
    \ }
" - Enabled formatters for Python
let g:neoformat_enabled_python = ['black', 'isort']
" Set JSON indent level to 4.
let g:neoformat_json_jq = {
    \ 'exe': 'jq',
    \ 'stdin': 1,
    \ 'args': ['--indent', '4', '.']
    \ }
"" SQL formatter
"let g:neoformat_sql_sqlformat = {
"    \ 'exe': '/home/waldbiec/.pyvenvs/neovim39/.venv/bin/sqlformat',
"    \ 'stdin': 1,
"    \ 'args': ['--reindent', '-'],
"    \ }
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

" Map Neomake and Neoformat to shortcuts.
nnoremap <f6> :Neomake <CR>
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

" Language server config
lua << EOF
-- Mappings.
local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format({async=true}) end, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

-- completer configuration.
local lsp = require "lspconfig"
local coq = require "coq" -- add this


-- this part is telling Neovim to use the pylsp server
lsp.pylsp.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        pylsp = {
            plugins = {
                flake8 = {
                    maxLineLength = 95
                },
                mccabe = {
                    enabled = false
                },
                pycodestyle = {
                    maxLineLength = 95
                }
            }
        }
    }
}

-- more completer stuff
-- lsp.pylsp.setup(coq.lsp_ensure_capabilities(<stuff...>)) -- after

lsp.tsserver.setup{}

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = "❗", Warn = "⚠ ", Hint = "🔍", Info = "ℹ" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

-- treesitter syntax highlighting config.
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" the [-s, --shut-up] flag will remove the greeting message
:COQnow -s
