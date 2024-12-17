return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
					},
				},
				capabilities = capabilities,
			})

			lspconfig.intelephense.setup({

				capabilities = capabilities,
			})
			lspconfig.phpactor.setup({
				filetypes = {
					"blade",
				},

				capabilities = capabilities,
			})
			lspconfig.html.setup({
				filetypes = {
					"html",
					"blade",
				},
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.somesass_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
			})
		end,
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- LSP Servers
					"lua_ls", -- Lua LSP
					"intelephense", -- PHP LSP
					"phpactor", -- PHP LSP
					"html", -- HTML LSP
					"ts_ls", -- Typescript / JavaScript LSP
					"cssls", -- CSS LSP
					"tailwindcss", -- Tailwind LSP
					"somesass_ls", -- SCSS LSP Extension
					"emmet_language_server", -- Emmet LSPo

					-- Formatters
					"php-cs-fixer", -- PHP Formatter
					"pint", -- PHP / Laravel Formatter
					"prettierd", -- JS/HTML/CSS Formatter
					"stylua", -- Lua Formatter
					"blade-formatter", -- Blade Formatter
				},
				auto_upade = true,
				run_on_start = true,
			})
		end,
	},

	{

		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				code_action = {
					enable = false,
				},
				lightbulb = {
					enable = false,
				},
				hover = {
					max_width = 0.5,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
