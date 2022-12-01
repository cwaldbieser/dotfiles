-- ==============
-- Neovim options
-- ==============

-- Tab expansion is 4 spaces.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Python support.
vim.g.python3_host_prog = '/home/waldbiec/.virtualenvs/neovim.3.10.env/bin/python'

-- Line numbering
vim.opt.rnu = true
vim.opt.nu = true

-- Allow switching buffers when there are unsaved changes.
vim.opt.hidden = true

-- Don't highlight all matching searches.
vim.opt.hls = false

-- Allow syntax highlighting for embedded lua and Python.
vim.g.vimsyn_embed = 'lP'
