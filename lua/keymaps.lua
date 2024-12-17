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

-- *** No arrow keys for you, motherfucker! *** --

vim.keymap.set({ "n", "v" }, "<Up>", "<Nop>", options)
vim.keymap.set({ "n", "v" }, "<Down>", "<Nop>", options)
vim.keymap.set({ "n", "v" }, "<Left>", "<Nop>", options)
vim.keymap.set({ "n", "v" }, "<Right>", "<Nop>", options)
