return {

	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({
				hooks = {
					view_opened = function()
						for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
							local buf = vim.api.nvim_win_get_buf(win)
							local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
							local is_diff_mode = vim.api.nvim_win_get_option(win, "diff")
							print("Window:", win, "Filetype:", filetype, "Diff Mode:", is_diff_mode)

							if is_diff_mode and filetype ~= "DiffviewFiles" then
								vim.api.nvim_win_set_option(win, "scrollbind", true)
							else
								vim.api.nvim_win_set_option(win, "scrollbind", false)
							end
						end
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
