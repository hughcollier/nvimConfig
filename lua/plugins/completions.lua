return {

	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = "rafamadriz/friendly-snippets",

		version = "v0.*",

		opts = {

			keymap = { preset = "default" },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "normal",
			},

			-- completion = {
			-- 	menu = {
			-- 		draw = {
			-- 			treesitter = { "lsp" },
			-- 		},
			-- 	},
			-- },

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- optionally disable cmdline completions
				-- cmdline = {},
			},
		},
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		enabled = true,
		config = function()
			require("nvim-autopairs").setup({ map_cr = true })
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = {
					["html"] = {
						enable_close = true,
					},
				},
			})
		end,
	},
}
