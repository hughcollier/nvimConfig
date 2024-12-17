return {

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	{
		"Shatur/neovim-ayu",
		name = "ayu",
		priority = 1000,
		config = function()
			require("ayu").setup({
				overrides = function()
					if vim.o.background == "dark" then
						return { NormalNC = { bg = "#0f151e", fg = "#808080" } }
					else
						return { NormalNC = { bg = "#f0f0f0", fg = "#808080" } }
					end
				end,
			})
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
		enabled = false,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " Check Health",
							group = "DiagnosticHint",
							action = "checkhealth",
							key = "h",
						},
						{
							desc = "󰌞 Mason",
							group = "Number",
							action = "Mason",
							key = "d",
						},
					},
					project = {
						enable = true,
						limit = 8,
						icon = "your icon",
						label = "My Awesome Projects",
						action = function(path)
							if path then
								-- Change Neovim's working directory
								vim.cmd("cd " .. path)
								-- Update Neo-tree's directory
								vim.cmd("Neotree dir=" .. path)
								-- Open Telescope in the selected directory
								require("telescope.builtin").find_files({ cwd = path })
							else
								print("Error: No project path provided!")
							end
						end,
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
