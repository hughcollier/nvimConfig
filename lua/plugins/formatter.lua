return {
	{
		"mhartington/formatter.nvim",

		config = function()
			require("formatter").setup({
				logging = true,
				filetype = {
					-- If we want to set custom options
					-- php = {
					-- 	function()
					-- 		return {
					-- 			exe = "php-cs-fixer",
					-- 			args = {
					-- 				"fix",
					-- 				"--using-cache=no", -- Disable cache to force formatter to reanalyse the file
					-- 				"--quiet", -- Suppresses unnecessary output
					-- 			},
					-- 			stdin = false,
					-- 			ignore_exitcode = true,
					-- 		}
					-- 	end,
					-- },
					--

					php = {
						require("formatter.defaults").pint,
					},

					blade = {
						function()
							return {
								exe = "blade-formatter",
								args = {
									"--stdin",
									"--write",
								},
								stdin = true,
								ignore_exitcode = true,
							}
						end,
					},

					-- Or we can use the defaults like this:
					lua = {
						require("formatter.filetypes.lua").stylua,
					},

					javascript = {
						require("formatter.filetypes.javascript").prettierd,
					},

					html = {
						require("formatter.filetypes.html").prettierd,
					},

					css = {
						require("formatter.filetypes.css").prettierd,
					},

					scss = {
						require("formatter.filetypes.css").prettierd,
					},

					vue = {
						require("formatter.filetypes.vue").prettierd,
					},
				},
			})
		end,
	},
}
