return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {"php", "html", "javascript", "css", "scss", "markdown", "markdown_inline" },
			highlight = { enabled = true },
		})
	end,
}
