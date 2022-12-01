
lua << PLUGEND
-- Plugins
require('user.vimplug')
PLUGEND

"" Add local node binaries to PATH.
"if isdirectory($PWD .'/node_modules')
"    let $PATH .= ':' . $PWD . '/node_modules/.bin'
"endif

" Filetype detection
filetype plugin on

" Visual cues for my current position.
" - Make the current line number stand out from the relative line numbers.
hi CursorLineNR cterm=bold ctermbg=234 gui=bold guibg=#202020
"  Make spelling errors stand out even when row is highlighted.
hi SpellBad cterm=underline

" Configure the color column.
hi ColorColumn cterm=bold ctermbg=darkgrey gui=bold guibg=#202020

" Set color scheme.
if exists('+termguicolors')
    set termguicolors
    colorscheme night-owl
else
    set notermguicolors
    colorscheme industry
endif

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

" Lua configurations.
lua << EOF
require('user.options')
require('user.keymaps')
require('user.node_modules_util')
require('user.neoformat')
require('user.completer')
require('user.lsp')
require('user.syntax')
require('user.lualine')
require('user.whichkey')
EOF
