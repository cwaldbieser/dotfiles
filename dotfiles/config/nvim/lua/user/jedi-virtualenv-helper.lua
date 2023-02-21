
local utils = require('user.utils')
local lines_from = utils.lines_from

local M = {}

M["set_jedi_virtualenv"] = function(lsp_client)
    --print("client name: " .. client.name)
    if lsp_client.name == "jedi_language_server" then
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
                if lsp_client.config["init_options"] ~= nil then
                    if lsp_client.config.init_options["workspace"] ~= nil then
                        if lsp_client.config.init_options.workspace.environmentPath == pyexe then
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
                    lsp_client.config.init_options = vim.tbl_deep_extend("force",
                        lsp_client.config.init_options, init_options)
                    --print("copied setting: " .. client.config.init_options.workspace.environmentPath)
                    local client_config = lsp_client.config
                    vim.lsp.stop_client(lsp_client.id)
                    local new_client_id = vim.lsp.start_client(client_config)
                    vim.lsp.buf_attach_client(0, new_client_id)
                    --print("new client ID: " .. new_client_id)
                end
            end
        end
    end
end

return M
