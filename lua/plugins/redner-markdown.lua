return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		code = {
			position = "left",
			language_name = true,
			width = "block",
			left_pad = 5,
			right_pad = 5,
			border = "thin",
			-- Used above code blocks for thin border
			above = "▄",
			-- Used below code blocks for thin border
			below = "▀",
		},
		link = {
			enabled = false,
		},
		heading = {
			enabled = false,
			border_virtual = true,
			border = true,
			sign = false,
		},
	},
}
