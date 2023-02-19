local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.black, -- python formatter
        null_ls.builtins.formatting.autoflake, -- python remove unused imports
        null_ls.builtins.diagnostics.flake8.with({
            extra_args = { "--max-line-length", "95" },
        }), -- python diagnostics
        null_ls.builtins.diagnostics.shellcheck, -- shell script diagnostics
        null_ls.builtins.code_actions.shellcheck, -- shell script code actions
        null_ls.builtins.formatting.shfmt, -- shell script formatting
    },
})

-- Null-LS keymaps
local add_desc = require("user.keymap_helper").add_desc
vim.api.nvim_create_augroup("NullLSMaps", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    pattern = { "*.sh" },
    callback = function(ev)
        local leader_temp = vim.g.mapleader
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }
        vim.g.mapleader = ' '
        -- Start keymaps
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ timeout_ms = 2000 }) end,
            add_desc(bufopts, "Format code."))
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
            add_desc(bufopts, "Code action."))
        vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action,
            add_desc(bufopts, "Code action."))
        -- End keymaps
        vim.g.mapleader = leader_temp
    end,
    group = "NullLSMaps",
})
