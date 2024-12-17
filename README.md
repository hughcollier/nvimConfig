# About

A simple Neovim config for my personal needs.

---

## Requirements

This config was created using **Neovim v0.10.2**. I haven’t tested it on earlier versions, so no promises there.

You will need a **Nerd Font** to get all the pretty icons. I like **MesloLG Nerd Font**, which you can download [here](https://www.nerdfonts.com/font-downloads).

---

## Installation

Clone this repository into your Neovim config directory:

```bash
git clone https://github.com/your-repo.git ~/.config/nvim
```

Launch Neovim and Lazy should mostly handle the rest.

---

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

---

### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

Provides a clean and informative status bar at the bottom of Neovim.

---

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

A fantastic fuzzy finder for quickly searching files, buffers, or projects.

- **Invoke with**: `<C-p>`

---

### Themes

Currently installed themes:
- [**Catppuccin**](https://github.com/catppuccin/nvim)
- [**Ayu**](https://github.com/Shatur/neovim-ayu)

The active theme is **Ayu Mirage**.

---

### [Rainbow Delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim)

Adds rainbow brackets, which make reading nested code much easier. Seems to work with all languages supported by Treesitter but I have so far **not** been able to get it towork with Blade files.

---

### [ToggleTerm](https://github.com/akinsho/toggleterm.nvim)

**ToggleTerm** gives us integrated terminal windows without leaving Neovim.

- **Keybindings**:
  - `<leader>tt1` - `<leader>tt9`: Toggle terminals docked at the bottom (e.g., `<leader>tt1` toggles terminal 1).
  - `<C-t>`: Toggle all terminal windows.
  - `<Esc>`: Exit terminal mode and return to normal mode.

> Running processes will **continue in the background** when you toggle terminals off.

---

### [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

**Treesitter** provides better syntax highlighting. It works great for most file types but I have not yet got it working for Blade files (yet). See [here](https://github.com/EmranMR/tree-sitter-blade/discussions/19#discussion-5400675i) for a possible solution.

- **Install a new language**: `:TSInstall <language>`
- **List available languages**: `:TSInstallInfo`

---

### [Vim Blade](https://github.com/jwalton512/vim-blade)

Provides syntax highlighting for Blade files until I can get Blade support working with Treesitter. This plugin was archived in February 2022, so I’ll need to revisit this in the future.

---

### [Formatter](https://github.com/mhartington/formatter.nvim)

Handles code formatting for various file types.

---

## LSP Setup

### [Mason](https://github.com/williamboman/mason.nvim)

**Mason** allows us to easily install and manage LSP servers, linters, and formatters.  
- **Open the Mason GUI**: `:Mason`

---

### [Mason LSP Config](https://github.com/williamboman/mason-lspconfig.nvim)

Bridges the gap between Mason and `nvim-lspconfig`. While it supports the `ensure_installed` property for automatic LSP installation, we’re using **Mason Tool Installer** to handle everything (LSPs, formatters, and linters) in one place.

---

### [Mason Tool Installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)

Automates the installation of Mason tools, including LSP servers, formatters, and linters.

- **`ensure_installed`**: Lists all tools we want Mason to install.  
- **Auto-run on startup**: Ensures missing tools are installed when moving to a new machine.

**Note:** We need Mason LSP Config installed for this plugint to handle LSPs in `ensure_installed`.

---

### [Nvim LSP Config](https://github.com/neovim/nvim-lspconfig)

Configures LSP servers in Neovim. Works seamlessly with Mason.

---

### [LSPSaga](https://github.com/nvimdev/lspsaga.nvim)

Enhances the appearance and usability of LSP features like hover boxes, code actions, and diagnostics. Hover windows and code action pickers look much cleaner with LSPSaga and are configurable too. 

---

## Future Plans

- Get Blade files working properly with Treesitter for better syntax highlighting and rainbow brackets.
- Evaluate alternative plugins for Blade support if `vim-blade` becomes insufficient.
- Continue refining LSP and formatter setups for a seamless experience.
- Get autocompletions working 

---

## Notes to Self

- When moving this config to a new machine, make sure you have a **Nerd Font** installed and run Neovim once to trigger Lazy's setup.
- Check Mason to ensure all LSP servers, formatters, and linters are installed.

---

## Final Thoughts

This configuration is tailored to my needs and evolving workflow. If you’re looking to set up Neovim for your own use, feel free to take inspiration or adapt it to your liking.

---



