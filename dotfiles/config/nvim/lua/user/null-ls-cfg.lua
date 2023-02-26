local null_ls = require("null-ls")

local jsontool = require('user.jsontool')
local yamlfix = require('user.yamlfix')

null_ls.setup({
    sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.refactoring, -- multi-language refactoring tool
        null_ls.builtins.formatting.black, -- python formatter
        null_ls.builtins.formatting.autoflake, -- python remove unused imports
        null_ls.builtins.diagnostics.flake8.with({
            extra_args = { "--max-line-length", "95" },
        }), -- python diagnostics
        null_ls.builtins.diagnostics.shellcheck, -- shell script diagnostics
        null_ls.builtins.code_actions.shellcheck, -- shell script code actions
        null_ls.builtins.formatting.shfmt, -- shell script formatting

        null_ls.builtins.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "ansi" }, -- SQL linter
        }),
        null_ls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "ansi" }, -- SQL formatter
        }),
        null_ls.builtins.diagnostics.rstcheck, -- ReStructured Text linter
        jsontool.diagnostic, -- JSON linter
        jsontool.formatter, -- JSON formatter,
        null_ls.builtins.diagnostics.yamllint, -- YAML linter
        yamlfix.formatter, -- YAML formatter
        null_ls.builtins.formatting.xmlformat, -- XML formatter
    },
})

-- Null-LS keymaps
local add_desc = require("user.keymap_helper").add_desc
vim.api.nvim_create_augroup("NullLSMaps", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    pattern = { "*.sh", ".bashrc", "*.sql", "json", "xml", "yaml" },
    callback = function(ev)
        local leader_temp = vim.g.mapleader
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }
        vim.g.mapleader = ' '
        --print("null-ls setting keymaps ...")
        -- Start keymaps
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ timeout_ms = 2000 }) end,
            add_desc(bufopts, "Format code."))
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
            add_desc(bufopts, "Code action."))
        vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action,
            add_desc(bufopts, "Code action."))
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, add_desc(bufopts, 'Show diagnostics in float.'))
        vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist,
            add_desc(bufopts, 'Send diagnostics to location list.'))
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, add_desc(bufopts, 'Previous diagnostic.'))
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, add_desc(bufopts, 'Next diagnostic.'))
        -- End keymaps
        vim.g.mapleader = leader_temp
    end,
    group = "NullLSMaps",
})
