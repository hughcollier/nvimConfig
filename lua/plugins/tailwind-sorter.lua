return {
	"laytan/tailwind-sorter.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
	build = "cd formatter && npm ci && npm run build",
	config = true,
	on_save_pattern = {
		"*.html",
		"*.js",
		"*.jsx",
		"*.tsx",
		"*.twig",
		"*.hbs",
		"*.php",
		"*.heex",
		"*.astro",
		"*.blade.php",
	}, -- The file patterns to watch and sort.
	on_save_enabled = true,
}
