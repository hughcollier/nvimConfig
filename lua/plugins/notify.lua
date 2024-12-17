return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			stages = "fade", -- Animation style
			timeout = 5000, -- Message timeout in milliseconds
			max_width = 60,
			render = "wrapped-default",
		})

		-- Set notify as the default notification handler
		vim.notify = require("notify")
	end,
}
