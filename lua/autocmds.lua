-- Autocommand group for formatting
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Create a group to organize related autocommands
local format_group = augroup("__formatter__", { clear = true })

-- Autocommand(s) to run on file save
autocmd("BufWritePost", {
	group = format_group,
	callback = function(args)
		local clients = vim.lsp.get_active_clients({ bufnr = args.buf })
		local has_tailwind = false

		for _, client in ipairs(clients) do
			if client.name == "tailwindcss" then
				has_tailwind = true
				break
			end
		end

		-- Run TailwindSort if Tailwind CSS LSP is attached
		if has_tailwind then
			vim.cmd("TailwindSort")
		end

		-- Run formatter for all filetypes
		vim.cmd("FormatWrite")
	end,
})

-- We must delete our commit / rebase / config buffer before control is returned to git. Saving the buffer alone is not enough.
-- This autocommand will delete the buffer on `:wq` and also give us a 70 character column guide.

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "gitrebase", "gitconfig" },
	callback = function()
		vim.bo.bufhidden = "delete"
		vim.cmd("set colorcolumn=70")
	end,
})
