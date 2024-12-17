return {

	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({
				hooks = {
					diff_buf_read = function()
						vim.opt_local.relativenumber = false
						vim.opt_local.scrollbind = true
					end,
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
