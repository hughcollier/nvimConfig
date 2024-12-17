-- Autocommand group for formatting
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Create a group to organize related autocommands
local format_group = augroup("__formatter__", { clear = true })

-- Run formatting on save
autocmd("BufWritePost", {
	group = format_group,
	command = ":FormatWrite",
})
