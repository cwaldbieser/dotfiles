
-- =============================================
-- Neovim Language Server Protocol configuration
-- =============================================

-- Utility functions.
local add_desc = require('user.keymap_helper').add_desc

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer.
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, add_desc(bufopts, 'Get help on symbol under cursor.'))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, add_desc(bufopts, 'Go to definition.'))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, add_desc(bufopts, 'Go to implementation.'))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, add_desc(bufopts, 'Show references.'))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, add_desc(bufopts, 'Go to declaration.'))
    vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, add_desc(bufopts, 'Signature help.'))
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, add_desc(bufopts, 'Go to type definition.'))
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, add_desc(bufopts, 'Rename symbol.'))
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, add_desc(bufopts, 'Code action.'))
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format({async=true}) end, add_desc(bufopts, 'Format code.'))
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, add_desc(bufopts, 'Show diagnostics in float.'))
    vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist, add_desc(bufopts, 'Send diagnostics to location list.'))
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, add_desc(bufopts, 'Previous diagnostic.'))
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, add_desc(bufopts, 'Next diagnostic.'))
end

local lsp = require('lspconfig')

-- ------------------------------------
-- Python language server configuration
-- ------------------------------------
lsp.pylsp.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        pylsp = {
            plugins = {
                black = {
                    enabled = true,
                    cache_config = true,    -- default false
                    line_length = 88,       -- default 88
                    preview = true
                },
                flake8 = {
                    enabled = true,
                    maxLineLength = 95
                },
                mccabe = {
                    enabled = false
                },
                pycodestyle = {
                    enabled = false,
                }
            }
        }
    }
}

-- ----------------------------------------
-- TypeScript language server configuration
-- ----------------------------------------
lsp.tsserver.setup{}

-- -----------------------------
-- LSP diagnostics configuration
-- -----------------------------
-- Configure diagnositcs icons on the line number column.
-- This replaces plain E W signs to more fun ones.
-- !IMPORTANT: nerdfonts needs to be setup for this to work in your terminal.
local signs = { Error = "❗", Warn = " ", Hint = "🔍", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

