# Neovim Configuration

This is my personalized Neovim configuration built using Lua. It is organized for modularity and ease of customization. The configuration utilizes [Lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Folder Structure

```
~/.config/nvim/
├── init.lua                # Main entry point for Neovim configuration
├── lazy-lock.json          # Lock file for Lazy.nvim plugins
└── lua/
    └── ayush/
        ├── core/           # Core settings and key mappings
        │   ├── init.lua    # Base configuration
        │   ├── keymaps.lua # Key mappings
        │   └── options.lua # Editor options
        ├── lazy.lua        # Plugin management configuration (Lazy.nvim)
        └── plugins/        # Plugin-specific configurations
            ├── alpha.lua               # Dashboard plugin
            ├── auto-session.lua        # Session management
            ├── autopairs.lua           # Autopairing brackets
            ├── barbar.lua              # Tabline plugin
            ├── colorscheme.lua         # Theme settings
            ├── comment.lua             # Commenting utilities
            ├── dressing.lua            # UI enhancements
            ├── formatting.lua          # Code formatting
            ├── gitsigns.lua            # Git integration
            ├── indent-blankline.lua    # Indentation guides
            ├── linting.lua             # Code linting
            ├── lsp/                    # Language Server Protocol (LSP) configuration
            │   ├── lspconfig.lua       # Core LSP settings
            │   └── mason.lua           # Mason plugin for managing LSP servers
            ├── lualine.lua             # Statusline plugin
            ├── markdown-preview.lua    # Markdown preview
            ├── nvim-cmp.lua            # Autocompletion
            ├── nvim-tree.lua           # File explorer
            ├── presence.lua            # Discord Rich Presence integration
            ├── surround.lua            # Surround text utilities
            ├── substitute.lua          # Text substitution
            ├── telescope.lua           # Fuzzy finder
            ├── todo-comments.lua       # Highlight TODO comments
            ├── treesitter.lua          # Treesitter configuration for better syntax highlighting
            ├── trouble.lua             # Diagnostics list
            ├── vim-maximizer.lua       # Maximizing windows
            └── which-key.lua           # Keybinding helper
```

## Getting Started

1. **Install Neovim**: Ensure you have Neovim v0.9+ installed.
2. **Clone this repository**:
   ```bash
   git clone https://github.com/Ayush-oppie/neovim-config ~/.config/nvim
   ```
3. **Install dependencies**:
   - Install `Lazy.nvim`:
     ```bash
     git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim
     ```
   - Follow instructions for specific plugins as needed (e.g., installing LSP servers, Treesitter parsers).
4. **Start Neovim**:
   ```bash
   nvim
   ```
   Lazy.nvim will automatically install the required plugins.

## Key Features

- **Plugins**: Modular plugin setup for easier management.
- **LSP Support**: Built-in support for multiple languages with `mason.nvim` and `nvim-lspconfig`.
- **Autocomplete**: Powered by `nvim-cmp`.
- **Treesitter**: Syntax highlighting and code navigation.
- **File Explorer**: Navigate your files easily with `nvim-tree`.
- **Fuzzy Finder**: Quickly locate files, buffers, or symbols using `telescope.nvim`.
- **UI Enhancements**: Custom statusline, tabline, and additional visual improvements.
- **Productivity**: Includes session management, TODO highlights, surround editing, and more.

## Customization

### Core Settings

Modify `lua/ayush/core/` for base configurations:

- **Options**: Change editor options in `options.lua`.
- **Keymaps**: Update key mappings in `keymaps.lua`.

### Plugins

- Add or update plugins in `lua/ayush/lazy.lua`.
- Configure individual plugins in the `plugins/` directory.

## Credits

This configuration was inspired by various community-driven setups and my own preferences. Plugins are developed by the open-source community—check their respective repositories for detailed documentation.

