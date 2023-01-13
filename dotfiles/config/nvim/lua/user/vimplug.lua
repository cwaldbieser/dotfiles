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
Plug('rockerBOO/boo-colorscheme-nvim')
Plug('challenger-deep-theme/vim', { as = 'challenger-deep' })
Plug('morhetz/gruvbox')
Plug('rafamadriz/neon')
Plug('EdenEast/nightfox.nvim')
Plug('haishanh/night-owl.vim')
Plug('arcticicestudio/nord-vim')
Plug('rmehri01/onenord.nvim', { branch = 'main' })
Plug('pineapplegiant/spaceduck', { branch = 'main' })
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('Yagua/nebulous.nvim')
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
Plug('nvim-treesitter/playground')
-- Which key
Plug('folke/which-key.nvim')
-- Lua colorschemes
Plug('tjdevries/colorbuddy.nvim')
Plug('lalitmee/cobalt2.nvim')
-- nvim-tree file explorer
Plug('nvim-tree/nvim-tree.lua')
vim.call('plug#end')
