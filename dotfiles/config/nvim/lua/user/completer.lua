-- =======================
-- Completer configuration
-- =======================

-- Autostart completer.
vim.api.nvim_exec(
[[
let g:coq_settings = { 'auto_start': 'shut-up' }
]],
false)

-- Import the completer module.
local coq = require('coq') 
