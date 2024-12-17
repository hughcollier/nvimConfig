vim.opt.shortmess:append("I") -- Disable the intro screen

vim.cmd("set spelllang=en_gb") -- Set language used for spell checking to UK English
vim.cmd("set spellsuggest=best,9") -- Suggest at most 9 words

vim.cmd("set number")
vim.cmd("set relativenumber") -- Use relative line numbers
vim.cmd("set expandtab") -- Use spaces instead of tabs
vim.cmd("set shiftwidth=2") -- Set the number of space characters used for indentation
vim.cmd("set tabstop=2") -- Set the number of space to use instead of a tab
vim.cmd("set softtabstop=2") -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
vim.opt.signcolumn = "yes" -- Left margin stays fixed even if no signs (like lightbulbs etc.) are present. Prevents UI from jumping around when signs appear or disappear.

-- colorschemes currently being set by the Themery plugin
-- vim.cmd.colorscheme("nord") -- vim.cmd.colorscheme "nord"

vim.opt.fillchars:append({ diff = "╱" }) -- Set character used for fillchars

-- Use nvr (neovim-remote - https://github.com/mhinz/neovim-remote) - as our git editor.
-- When opening the git editor from am nvim :terminal make sure it opens a new tab in the current
-- nvim instance rather than as a nested nvim session inside the terminal.

if vim.fn.has("nvim") == 1 then
	vim.env.GIT_EDITOR = "nvr -cc tabnew --remote-wait"
end
