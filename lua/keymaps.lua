local options = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>db", ":Dashboard<CR>", options)
-- *** ToggleTerm Keympas *** -

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], options) -- Exit terminal mode with Escape key
vim.keymap.set("n", "<C-t>", ":ToggleTermToggleAll<CR>", options)
vim.keymap.set("n", "<leader>tta", ":ToggleTermToggleAll<CR>", options)

for i = 1, 9 do
	vim.keymap.set("n", "<leader>tt" .. i, ":ToggleTerm " .. i .. "<CR>", options)
end

-- *** Telescope Keympas *** ---

vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", options)
vim.keymap.set("n", "<leader><leader>", ":lua require('telescope').extensions.recent_files.pick()<CR>", options)

-- *** Neotree Keympas *** ---

vim.keymap.set("n", "<C-1>", ":Neotree<CR>", options)

-- *** LSP Keympas *** --

-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true,silent = true })
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>>", options)
vim.keymap.set("n", "<leader>gd", ":Lspsaga goto_definition<CR>", options) -- Go to Definition
vim.keymap.set("n", "<leader>gp", ":Lspsaga peek_definition<CR>", options) -- Peek Definition

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- *** Git Related Keymaps *** ---

-- Open Diffview for current file

vim.keymap.set("n", "<leader>df", function()
	local filepath = vim.fn.expand("%")
	local filename = vim.fn.expand("%:t")

	-- Check if the file exists in HEAD~1
	local git_output = vim.fn.system("git cat-file -e HEAD~1:" .. filepath)
	if vim.v.shell_error ~= 0 then
		vim.notify(
			"Either"
				.. filename
				.. " does not exist in previous commit or your current working directory is outside of this Git repo.",
			"error",
			{
				title = "File is Untracked",
				max_width = 600,
			}
		)
		return
	end

	-- Open Diffview if the file exists
	vim.cmd("DiffviewOpen HEAD~1 " .. filepath)
end, options)

vim.keymap.set("n", "<leader>pdf", ":DiffviewOpen HEAD~1<CR>", options) -- Open Project Diffview

vim.keymap.set("n", "<leader>edf", ":DiffviewClose<CR>", options) -- Close Diffview

-- *** No arrow keys for you, motherfucker! *** --

vim.keymap.set({ "n", "v" }, "<Up>", "<Nop>", options)
vim.keymap.set({ "n", "v" }, "<Down>", "<Nop>", options)
vim.keymap.set({ "n", "v" }, "<Left>", "<Nop>", options)
vim.keymap.set({ "n", "v" }, "<Right>", "<Nop>", options)
