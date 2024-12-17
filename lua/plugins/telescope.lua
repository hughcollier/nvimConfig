return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						".git",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
					recent_files = {
						only_cwd = true,
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("recent_files")
		end,
	},

	{
		{ "smartpde/telescope-recent-files" },
	},
	{

		"nvim-telescope/telescope-ui-select.nvim",
	},
}
