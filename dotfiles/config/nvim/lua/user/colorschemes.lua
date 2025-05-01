-- --------------------------
-- Colorschemes configuration
-- --------------------------

local bluloco = require("bluloco")
bluloco.setup()
--require("night-owl").setup()

-- Set the colorscheme.
--vim.cmd("colorscheme night-owl")

-- Minimal config
require("themery").setup({
	themes = {
		"night-owl",
		"WinterIsComing-dark-blue-color-theme",
		"ariake",
		"blue",
        {
            name = "bluloco",
            colorscheme = "bluloco",
        },
		"boo",
		"carbonfox",
		"catppuccin",
		"catppuccin-mocha",
		"challenger_deep",
		"crimson_moonlight",
		"darkblue",
		"duskfox",
		"eldritch",
		"forest_stream",
		"kyotonight",
		"lackluster",
		"lackluster-mint",
		"lunaperche",
		"neon",
		"nightfox",
		"nord",
		"nordfox",
		"spaceduck",
		"substrata",
		"tokyonight",
		"tokyonight-moon",
		"tokyonight-night",
		"tokyonight-storm",
	}, -- Your list of installed colorschemes.
	livePreview = true, -- Apply theme while picking. Default to true.
})

