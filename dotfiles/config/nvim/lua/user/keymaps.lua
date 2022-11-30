
-- ===================
-- User custom keymaps
-- ===================

-- Utility functions
local add_desc = require('user.keymap_helper').add_desc
local keymap = vim.api.nvim_set_keymap

-- Default options for keymaps.
local opts = { noremap=true, silent=true }

-- --------------
-- Visual keymaps
-- --------------

-- When indenting / dedenting, retain the selection.
keymap("v", "<", "<gv", add_desc(opts, 'Dedent block.'))
keymap("v", ">", ">gv", add_desc(opts, 'Indent block.'))

-- Move blocks of text up and down.
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", add_desc(opts, 'Move block up 1 line.'))
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", add_desc(opts, 'Move block down 1 line.'))
