return {

	-- Theme swicther

	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					"catppuccin",
					"ayu-mirage",
					"kanagawa-wave",
					"nord",
					"nordic",
					"duskfox",
					"nordfox",
					"embark",
				}, -- Your list of installed colorschemes.
				livePreview = true, -- Apply theme while picking. Default to true.
			})
		end,
	},

	-- Catppuccin theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	-- Ayu theme

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

	-- Kanagawa theme

	{
		"rebelot/kanagawa.nvim",
	},

	-- Nord theme

	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({})
			vim.cmd.colorscheme("nord")
		end,
	},
	install = {
		colorscheme = { "nord" },
	},

	-- Nordic theme

	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},

	-- Nightfox theme

	{ "EdenEast/nightfox.nvim" },

	-- Embark theme

	{ "embark-theme/vim" },

	-- Alpha splash screen

	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
		enabled = false,
	},

	-- Dashboard splash screen

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
						icon = "  ",
						label = "My Projects",
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
