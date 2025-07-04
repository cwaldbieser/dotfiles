-- ========
-- Vim Plug
-- ========

local Plug = vim.fn["plug#"]
vim.fn["plug#begin"](vim.fn.stdpath("data") .. "/plugged")
-- If you want to have icons in your statusline choose one of these
Plug("nvim-tree/nvim-web-devicons")
Plug("echasnovski/mini.icons")
-- lualine
Plug("nvim-lualine/lualine.nvim")
-- NERDcomment
Plug("preservim/nerdcommenter")
-- vim-unimpared - shortcuts for paired operations like :lnext/:lprev
Plug("tpope/vim-unimpaired")
-- Git Fugitive
Plug("tpope/vim-fugitive")
-- Colorschemes
Plug("rockerBOO/boo-colorscheme-nvim")
Plug("challenger-deep-theme/vim", { as = "challenger-deep" })
Plug("morhetz/gruvbox")
Plug("rafamadriz/neon")
Plug("EdenEast/nightfox.nvim")
Plug("haishanh/night-owl.vim")
--Plug("oxfist/night-owl.nvim")
Plug("arcticicestudio/nord-vim")
Plug("pineapplegiant/spaceduck", { branch = "main" })
Plug("folke/tokyonight.nvim", { branch = "main" })
Plug("voidekh/kyotonight.vim")
Plug("rktjmp/lush.nvim") -- Required for bluloco
Plug("uloco/bluloco.nvim")
Plug("eldritch-theme/eldritch.nvim")
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("jim-at-jibba/ariake.nvim")
Plug("slugbyte/lackluster.nvim")
Plug("atmosuwiryo/vim-winteriscoming")
Plug("kvrohit/substrata.nvim")
Plug("nyoom-engineering/oxocarbon.nvim")
Plug("mhartington/oceanic-next")
Plug("shaunsingh/moonlight.nvim")
Plug("zootedb0t/citruszest.nvim")
-- Colorscheme switcher.
Plug("zaldih/themery.nvim")
-- Gitsigns
Plug("lewis6991/gitsigns.nvim")
-- Easymotion
--Plug("easymotion/vim-easymotion")
-- Flash.nim
Plug("folke/flash.nvim")
-- Plenary
-- Required by other plugins; e.g. null-ls
Plug("nvim-lua/plenary.nvim")
-- LSP client configuration.
Plug("neovim/nvim-lspconfig")
-- null-ls integrates standalone tools as a language server
Plug("nvimtools/none-ls.nvim")
Plug("nvimtools/none-ls-extras.nvim")
-- Completer coq-nvim
Plug("ms-jpq/coq_nvim", { branch = "coq" })
Plug("ms-jpq/coq.artifacts", { branch = "artifacts" })
-- Treesitter syntax highlighting
-- To install a given languare-- :TSInstall <language_to_install>
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
-- Which key
Plug("folke/which-key.nvim")
-- Toggle term
Plug("akinsho/toggleterm.nvim", { ["tag"] = "2.3.0" })
-- Refactor tool
--Plug("ThePrimeagen/refactoring.nvim")
-- Telescope
-- Requires plenary.nvim (see above)
Plug("nvim-telescope/telescope.nvim")
-- Undo Tree
Plug("mbbill/undotree")
-- Ref jump
Plug("mawkler/refjump.nvim")
-- screenkey
Plug("NStefan002/screenkey.nvim")
-- keepcursor
Plug("rlychrisg/keepcursor.nvim")
-- snacks
Plug("folke/snacks.nvim")
-- ufo; code folding
Plug("kevinhwang91/promise-async")
Plug("kevinhwang91/nvim-ufo")
-- noice
Plug("MunifTanjim/nui.nvim")
Plug("rcarriga/nvim-notify")
Plug("folke/noice.nvim")
vim.fn["plug#end"]()
