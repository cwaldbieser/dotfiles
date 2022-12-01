-- ========
-- Vim Plug
-- ========

local Plug = vim.fn['plug#']
vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')
-- lualine
Plug('nvim-lualine/lualine.nvim')
-- If you want to have icons in your statusline choose one of these
Plug('nvim-tree/nvim-web-devicons')
-- NERDcomment
Plug('preservim/nerdcommenter')
-- NERDtree - file manager
Plug('preservim/nerdtree')
-- vim-unimpared - shortcuts for paired operations like :lnext/:lprev
Plug('tpope/vim-unimpaired')
-- neoformat - code formatter
Plug('sbdchd/neoformat')
-- FZF
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug('junegunn/fzf.vim')
-- Git Fugitive
Plug('tpope/vim-fugitive')
-- Colorschemes
Plug('morhetz/gruvbox')
Plug('arcticicestudio/nord-vim')
Plug('pineapplegiant/spaceduck', { branch = 'main' })
Plug('challenger-deep-theme/vim', { as = 'challenger-deep' })
Plug('haishanh/night-owl.vim')
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('EdenEast/nightfox.nvim')
-- Colorscheme switcher.
Plug('xolox/vim-misc')
Plug('xolox/vim-colorscheme-switcher')
-- Gitgutter
Plug('airblade/vim-gitgutter')
-- Easymotion
Plug('easymotion/vim-easymotion')
-- LSP client configuration.
Plug('neovim/nvim-lspconfig')
-- Completer coq-nvim
Plug('ms-jpq/coq_nvim', { branch = 'coq' })
Plug('ms-jpq/coq.artifacts', { branch = 'artifacts' })
-- Treesitter syntax highlighting
-- To install a given languare-- :TSInstall <language_to_install>
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
-- Which key
Plug('folke/which-key.nvim')

vim.call('plug#end')
