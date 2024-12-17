# About

A simple Neovim config for my personal needs.

## Requirements

This config was created using **Neovim v0.10.2**. I haven’t tested it on earlier versions, so no promises there.

You will need a **Nerd Font** to get all the pretty icons. I like **MesloLG Nerd Font**, which you can download [here](https://www.nerdfonts.com/font-downloads).

To have the git commit editor open up nicely from a terminal inside of neovim then we need to have the `nvr` package installed: 

```shell
brew install nvr
```

## Installation

Clone this repository into your Neovim config directory:

```bash
git clone https://github.com/your-repo.git ~/.config/nvim
```

Launch Neovim and Lazy should mostly handle the rest. Branch `main` should always contain stable working config that may not be using the most up to date plugin versions. Branch `update` used to test plugin updates before updating main. 

## Installed Plugins

### [Lazy](https://github.com/folke/lazy.nvim)

**Lazy** is our plugin/package manager. It handles plugin installations and dependencies for us.

Most plugins get their own configuration file under `~/.config/nvim/lua/plugins/`, but some related plugins (like those for LSP functionality) are grouped into the same file where I feel it makes sense.

```
~/.config/nvim
├── lua
│   ├── config
│   │   └── lazy.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
```

Do not run Lazy updates on `main` branch before verifying nothing breaks first by updating the `update` branch. We can tell Lazy to revert all installed plugins to the versions listed in the lockfile by running the `:Lazy restore` command. This is important when switching branches that contain different versions of the same plugin because the plugins themselves reside outside of our git directory and therefore are not under version control. 

### [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)

File browser. Press `?` when in normal mode with window active to see other key bindings. Open file in horizontal split view with `S` and vertical split with `s`. 

- **Key bindings**:
  - `<C-1>`: Toggle Neo-tree sidebar. 
  
### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

Provides a clean and informative status bar at the bottom of Neovim.

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

A fantastic fuzzy finder for quickly searching files, buffers, or projects.

- **Key bindings**:
  - `<C-p>`: Find / search files
  - `<leader><leader>`: Find / search recent files
  - `<leader>km`: Find / search key bindings

Pressing `<C-v>` to open a file from the Telescope picker will open the file in a vertical split. `<C-x>` in a horizontal split.

### Themes

Currently installed themes:
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Ayu](https://github.com/Shatur/neovim-ayu)
- [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- [Nord](https://github.com/gbprod/nord.nvim)
- [Nordic](https://github.com/AlexvZyl/nordic.nvim)
- [Nightfox](https://github.com/EdenEast/)
- [Embark](https://github.com/embark-theme/vim) 

No theme is set as this is handled by Themery.

### [Themery](https://github.com/zaldih/themery.nvim)

Used to easily switch between themes in a nice menu with live preview.

- **Key bindings**:
  - `<leader>st` - Bring up theme select/switcher menu 

### [Rainbow Delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim)

Adds rainbow brackets, which make reading nested code much easier. Seems to work with all languages supported by Treesitter but I have so far **not** been able to get it to work with Blade files.

### [ToggleTerm](https://github.com/akinsho/toggleterm.nvim)

**ToggleTerm** gives us integrated terminal windows without leaving Neovim.

- **Key bindings**:
  - `<leader>tt1` - `<leader>tt9`: Toggle terminals docked at the bottom (e.g., `<leader>tt1` toggles terminal 1).
  - `<C-t>`: Toggle all terminal windows.
  - `<Esc>`: Exit terminal mode and return to normal mode.

> Running processes will **continue in the background** when you toggle terminals off.

### [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

**Treesitter** provides us with better and smarter syntax highlighting.

- **Install a new language**: `:TSInstall <language>`
- **List available languages**: `:TSInstallInfo`

We can get information about current syntax highlighting for the text below the cursor with the `:Inspect` command. This can be useful for verifying if we have Treesitter setup properly for certain languages. We can also use `:TSToggle highlight` to toggle Treesitter highlighting on and off which allows us to easily see what highlighting is being applied. 

Setting up all the languages that I care about was super easy with the exception of `*.blade.php` files. For this to work there was little extra work required which is outlined [here](https://github.com/EmranMR/tree-sitter-blade/discussions/19#discussion-5400675i) 
 
### [Formatter](https://github.com/mhartington/formatter.nvim)

Handles code formatting for various file types. We have an auto command setup that auto formats on save but we can also manually format the currently open buffer using the `:Format` command. 

## LSP Setup

### [Mason](https://github.com/williamboman/mason.nvim)

**Mason** allows us to easily install and manage LSP servers, linters, and formatters.  
- **Open the Mason GUI**: `:Mason`

### [Mason LSP Config](https://github.com/williamboman/mason-lspconfig.nvim)

Bridges the gap between Mason and `nvim-lspconfig`. While it supports the `ensure_installed` property for automatic LSP installation, we’re using **Mason Tool Installer** to handle everything (LSPs, formatters, and linters) in one place.

### [Mason Tool Installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)

Automates the installation of Mason tools, including LSP servers, formatters, and linters.

- **`ensure_installed`**: Lists all tools we want Mason to install.  
- **Auto-run on startup**: Ensures missing tools are installed when moving to a new machine.

**Note:** We need Mason LSP Config installed for this plugin to handle LSPs in `ensure_installed`.

### [Nvim LSP Config](https://github.com/neovim/nvim-lspconfig)

Configures LSP servers in Neovim. Works seamlessly with Mason.

### [LSPSaga](https://github.com/nvimdev/lspsaga.nvim)

Enhances the appearance and usability of LSP features like hover boxes, code actions, and diagnostics. Hover windows and code action pickers look much cleaner with LSPSaga and are configurable too. 

- **Key bindings**
  - `K`: Show LSP info for item under the cursor
  - `<leader>gd`: Go to class / function definition
  - `<leader>gp`: Preview class / function definition 

### [DiffView](https://github.com/sindrets/diffview.nvim)

Cycle through diffs for modified files in current working directory.

- **Key bindings**:
  - `<leader>df`: Open DiffView for the file in the current buffer and compare to previous commit. 
  - `<leader>pdf`: Open DiffView for entire project.
  - `<leader>hdf`: Open DiffviewFileHistory for the file in the current buffer.
  - `<leader>x`: Close DiffView

### [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

Adds coloured signs to gutter / margin to show what part of a file has changed. Can also be configured to show git blame lines using ghost text. 

### [Notify](https://github.com/rcarriga/nvim-notify)

A nice fancy pretty notification manager.

### [Laravel](https://adalessa.github.io/laravel-nvim-docs/docs/repositories/commands/)

Provides some really nice features for working with Laravel projects. Does things like providing route info inside controllers using virtual text as well as providing a really nice interface for executing `php artisan` commands. Use the `:Laravel` command to access the picker. Full docs can be found [here](https://adalessa.github.io/laravel-nvim-docs/docs/getting-started/). 

### [Blink.cmp](https://github.com/Saghen/blink.cmp)

Provides auto complete features - seems to work really well with almost no config required. Love it! 
### [Autopairs](https://github.com/windwp/nvim-autopairs?tab=readme-ov-file)

Autopair plugin. Works great with default settings.

### [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)

Uses treesitter to auto close and rename html tags. From the docs:

```
Before        Input         After
------------------------------------
<div           >              <div></div>
<div></div>    ciwspan<esc>   <span></span>
------------------------------------
```

### [vim-be-good](https://github.com/ThePrimeagen/vim-be-good)

A set of games to get good with vim. Launch with the `:VimBeGood` command.

### [Render Markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)

 Highly configurable plugin for making markdown files look pretty.

### [Which-Key](https://github.com/folke/which-key.nvim)

WhichKey helps you remember your Neovim keymaps, by showing available key bindings in a popup as you type. There is also the option to add a curated list of key bindings to a dedicated popup accessible via `<leader>?` which I really like the idea of but cannot get working properly so will revisit later.

### [nvim-highlight-colors](https://github.com/bren:/oprata10/nvim-highlight-colors)

Highlights colours for us in css / scss files.

### [commentary.vim](https://github.com/tpope/vim-commentary)

Great plugin to help with commenting code. From the docs:

Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion (for example, `gcap` to comment out a paragraph), `gc` in visual mode to comment out the selection, and `gc` in operator pending mode to target a comment. You can also use it as a command, either with a range like `:7,17Commentary`.

### [Tailwind Sorter](https://github.com/laytan/tailwind-sorter.nvim)

Sorts tailwind classes into a logical order. This config uses an autocommand that sorts on file save if the tailwindcsss LSP is attached to the buffer. Otherwise can be ran manually with the command `:TailwindSort`

## Spell Checking

`<leader>sp` toggles the highlighting of miss-spelled words. While the cursor is over a miss-spelled word in insert mode we can press `<C-x>` followed by `s` to bring up a completion menu. To add a word to the dictionary use `zg` while in normal mode.


## Future Plans

- Setup [code folding](https://github.com/kevinhwang91/nvim-ufo)
- Look into indent highlighting
- Refine spell checking setup which is a little clunky right now.

## Notes to Self

- When moving this config to a new machine, make sure you have a **Nerd Font** installed and run Neovim once to trigger Lazy's setup.
- [Look here](https://www.nerdfonts.com/cheat-sheegt) for a helpful way to find specific Nerd Font glyphs and icons. 
- To make sure all plugins are at the versions specified in the lockfile run `:Lazy restore`
- Check Mason to ensure all LSP servers, formatters, and linters are installed.

## Final Thoughts

This configuration is tailored to my needs and evolving workflow. If you’re looking to set up Neovim for your own use, feel free to take inspiration or adapt it to your liking.

---

