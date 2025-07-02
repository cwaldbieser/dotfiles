-- =====================
-- Lualine configuration
-- =====================

-- Include icons.
require("nvim-web-devicons").setup()

-- lualine configuration
require("lualine").setup({
	options = {
		-- icons_enabled=false,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				symbols = { error = "", warn = "", info = "", hint = "🔍" },
			},
		},
		lualine_x = {
			{
				"encoding",
				-- icons_enabled=false
			},
			{
				"fileformat",
				icons_enabled = false,
			},
			{
				"filetype",
				-- icons_enabled=false
			},
			-- noice integration for macro recording.
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
				color = { fg = "#ff9e64" },
			},
		},
	},
})
