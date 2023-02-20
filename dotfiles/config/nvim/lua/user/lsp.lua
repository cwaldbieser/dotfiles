-- =============================================
-- Neovim Language Server Protocol configuration
-- =============================================

-- Utility functions.
local add_desc = require('user.keymap_helper').add_desc
local utils = require('user.utils')
local lines_from = utils.lines_from

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer.
-- `on_attach(client, bufnr)`
local on_attach = function(client, bufnr)
    --print("client name: " .. client.name)
    if client.name == "jedi_language_server" then
        local bufpath = vim.api.nvim_buf_get_name(0)
        local bufdir = vim.fs.dirname(bufpath)
        local find_results = vim.fs.find({ '.pyinit' }, { ['upward'] = true, ['path'] = bufdir })
        if #find_results == 1 then
            local pyinit = find_results[1]
            local lines = lines_from(pyinit)
            local pyexe = nil
            if #lines > 0 then
                --print(".pyinit found")
                for _, line in pairs(lines) do
                    local is_comment = line:find("#", 1, true) == 1
                    local is_blank   = line == nil or line:match("%S") == nil
                    if (not is_blank) and (not is_comment) then
                        pyexe = line
                    end
                end
                --print("pyexe: " .. pyexe)
                local needs_new = true
                if client.config["init_options"] ~= nil then
                    if client.config.init_options["workspace"] ~= nil then
                        if client.config.init_options.workspace.environmentPath == pyexe then
                            needs_new = false
                        end
                    end
                end
                --print("needs_new: " .. tostring(needs_new))
                if needs_new then
                    local init_options = {
                        workspace = {
                            environmentPath = pyexe
                        }
                    }
                    --print("init_options: " .. utils.tprint(init_options))
                    client.config.init_options = vim.tbl_deep_extend("force",
                        client.config.init_options, init_options)
                    --print("copied setting: " .. client.config.init_options.workspace.environmentPath)
                    local client_config = client.config
                    vim.lsp.stop_client(client.id)
                    local new_client_id = vim.lsp.start_client(client_config)
                    vim.lsp.buf_attach_client(0, new_client_id)
                    --print("new client ID: " .. new_client_id)
                end
            end
        end
    end
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local leader_temp = vim.g.mapleader
    vim.g.mapleader = ' '
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, add_desc(bufopts, 'Get help on symbol under cursor.'))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, add_desc(bufopts, 'Go to definition.'))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, add_desc(bufopts, 'Go to implementation.'))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, add_desc(bufopts, 'Show references.'))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, add_desc(bufopts, 'Go to declaration.'))
    vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, add_desc(bufopts, 'Signature help.'))
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, add_desc(bufopts, 'Go to type definition.'))
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, add_desc(bufopts, 'Rename symbol.'))
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, add_desc(bufopts, 'Code action.'))
    vim.keymap.set('v', '<leader>ca', vim.lsp.buf.code_action, add_desc(bufopts, 'Code action.'))
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end,
        add_desc(bufopts, 'Format code.'))
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, add_desc(bufopts, 'Show diagnostics in float.'))
    vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, add_desc(bufopts, 'Send diagnostics to location list.'))
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, add_desc(bufopts, 'Previous diagnostic.'))
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, add_desc(bufopts, 'Next diagnostic.'))
    vim.g.mapleader = leader_temp
    -- This should really be conditional depending on the LSP server.
    vim.opt.formatexpr = ""
end

local lsp = require('lspconfig')

-- ------------------------------------
-- Python language server configuration
-- ------------------------------------
lsp.jedi_language_server.setup {
    on_attach = on_attach,
}

-- ----------------------------------------
-- TypeScript language server configuration
-- ----------------------------------------
lsp.tsserver.setup {
    on_attach = on_attach,
}

-- -------------------
-- Lua language server
-- -------------------
lsp.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                -- Suppress workspace query for VS Code.
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- -----------------------------
-- LSP diagnostics configuration
-- -----------------------------
-- Configure diagnositcs icons on the line number column.
-- This replaces plain E W signs to more fun ones.
-- !IMPORTANT: nerdfonts needs to be setup for this to work in your terminal.
local signs = { Error = "❗", Warn = " ", Hint = "🔍", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
