return {
	"folke/noice.nvim",
	event = "VeryLazy",
	init = function()
		local noice = require("noice")
		noice.setup()
	end,
}
