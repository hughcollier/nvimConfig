local options = { noremap = true, silent = true }

local function merge_options(desc, overrides)
	overrides = overrides or {}
	overrides.desc = desc
	return vim.tbl_extend("force", options, overrides)
end

vim.keymap.set("n", "<leader>home", ":Dashboard<CR>", merge_options("Go to dashboard"))

-- *** ToggleTerm Keympas *** -

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], merge_options("Exit terminal moed with Esacpe key"))
vim.keymap.set("n", "<C-t>", ":ToggleTermToggleAll<CR>", merge_options("Toggle all Terminal windows off/on"))

for i = 1, 9 do
	vim.keymap.set(
		"n",
		"<leader>tt" .. i,
		":ToggleTerm " .. i .. "<CR>",
		merge_options("Toggle/create terminal at position " .. i)
	)
end

-- *** Telescope Keympas *** ---

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", merge_options("Find files in project"))
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", merge_options("Find files in project"))
vim.keymap.set(
	"n",
	"<leader><leader>",
	":lua require('telescope').extensions.recent_files.pick()<CR>",
	merge_options("Search recent files")
)
vim.keymap.set("n", "<leader>km<CR>", ":Telescope keymaps<CR>", merge_options("Fuzzy search all keymaps"))

-- *** Neotree Keympas *** ---

vim.keymap.set("n", "<C-1>", ":Neotree toggle=true<CR>", merge_options("Toggle Neo-tree sidebar"))

-- *** LSP Keympas *** --

-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true,silent = true })
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>>", merge_options("Show LSP info for item under cursor"))
vim.keymap.set("n", "<leader>gd", ":Lspsaga goto_definition<CR>", merge_options("Go to class/function definition")) -- Go to Definition
vim.keymap.set("n", "<leader>gp", ":Lspsaga peek_definition<CR>", merge_options("Preview class/function definition")) -- Peek Definition

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, merge_options("Show available code actions"))

-- *** Git Related Keymaps *** ---

-- Open Diffview for current file

vim.keymap.set("n", "<leader>df", function()
	local filepath = vim.fn.expand("%")
	local filename = vim.fn.expand("%:t")

	-- Check if the file exists in HEAD~1
	local git_output = vim.fn.system("git ls-tree -r --name-only HEAD | grep '^" .. filepath .. "$'")
	if vim.v.shell_error ~= 0 then
		vim.notify(
			"Either "
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
	vim.cmd("DiffviewOpen HEAD " .. filepath)
end, merge_options("Compare current file to previous commit"))

vim.keymap.set("n", "<leader>pdf", ":DiffviewOpen<CR>", merge_options("Open project Diff View"))
vim.keymap.set(
	"n",
	"<leader>hdf",
	":DiffviewFileHistory % <CR>",
	merge_options("Open Diff View File History for current file")
)
vim.keymap.set("n", "<leader>x", ":DiffviewClose<CR>", merge_options("Close Diff View"))

-- Theme Switch

vim.keymap.set("n", "<leader>st", ":Themery<CR>", merge_options("Switch active theme"))

-- Toggle spell checker

vim.keymap.set("n", "<leader>sp", ":set spell!<CR>", merge_options("Toggle highlighting of miss spelled words"))

-- *** No arrow keys for you, motherfucker! *** --

vim.keymap.set({ "n", "v" }, "<Up>", "<Nop>", options)
vim.keymap.set({ "n", "v" }, "<Down>", "<Nop>", options)
vim.keymap.set({ "n", "v" }, "<Left>", "<Nop>", options)
vim.keymap.set({ "n", "v" }, "<Right>", "<Nop>", options)
