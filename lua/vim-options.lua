vim.opt.shortmess:append("I") -- Disable the intro screen

vim.cmd("set relativenumber") -- Use relative line numbers
vim.cmd("set expandtab") -- Use spaces instead of tabs
vim.cmd("set shiftwidth=2") -- Set the number of space characters used for indentation
vim.cmd("set tabstop=2") -- Set the number of space to use instead of a tab
vim.cmd("set softtabstop=2") -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
vim.opt.signcolumn = "yes" -- Left margin stays fixed even if no signs (like lightbulbs etc.) are present. Prevents UI from jumping around when signs appear or disappear.

vim.cmd.colorscheme("ayu-mirage") -- vim.cmd.colorscheme "catppuccin"

vim.opt.fillchars:append({ diff = "╱" }) -- Set character used for fillchars
