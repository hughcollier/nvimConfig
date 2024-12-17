return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- Add parser for blade files
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		require("nvim-treesitter.configs").setup({
			ensure_installed = { "php", "html", "javascript", "css", "scss", "markdown", "markdown_inline", "blade" },
			highlight = { enable = true },
		})
	end,
}
