```
 __   __   ________  ___ __ __   ___ __ __   __  __
/_/\ /_/\ /_______/\/__//_//_/\ /__//_//_/\ /_/\/_/\
\:\ \\ \ \\__.::._\/\::\| \| \ \\::\| \| \ \\ \ \ \ \
 \:\ \\ \ \  \::\ \  \:.      \ \\:.      \ \\:\_\ \ \
  \:\_/.:\ \ _\::\ \__\:.\-/\  \ \\:.\-/\  \ \\::::_\/
   \ ..::/ //__\::\__/\\. \  \  \ \\. \  \  \ \ \::\ \
    \___/_( \________\/ \__\/ \__\/ \__\/ \__\/  \__\/

```

# Vimmy - Modern Vim Configuration

A modern, well-organized Vim configuration with LSP support, fuzzy finding, and sensible defaults.

## Features

### Modern Plugin Management
- **vim-plug**: Fast, minimalist plugin manager with parallel installation
- Auto-installation on first run

### Intelligent Code Completion
- **CoC (Conquer of Completion)**: Full LSP support with auto-completion
- Language servers for Python, Go, Rust, JavaScript/TypeScript, YAML, and more
- Code navigation (go to definition, references, implementations)
- Inline diagnostics and error checking
- Symbol renaming and code actions

### Fast Fuzzy Finding
- **fzf.vim**: Blazingly fast fuzzy finder
- Search files, buffers, lines, marks, git history
- ripgrep integration for content search

### Productivity Tools
- **NERDTree**: File explorer
- **vim-fugitive**: Git integration
- **vim-airline**: Beautiful status line
- **vim-gitgutter**: Git diff in sign column
- **Tagbar**: Code structure overview
- **FastFold**: Optimized folding

### Language Support
- Python (with Pyright LSP)
- Go (with gopls)
- Rust (with rust-analyzer)
- JavaScript/TypeScript (with tsserver)
- Ruby
- Terraform
- YAML
- TOML
- Ansible

### Modern Colorschemes
- Gruvbox (default)
- Dracula
- Everforest
- Catppuccin

## Installation

### Quick Install

Clone and run the installer:

```bash
git clone git@github.com:kevinjqiu/vimmy.git
cd vimmy
make install
```

This will:
1. Create symlinks for `~/.vimrc` and `~/.vim`
2. Install vim-plug
3. Install all plugins automatically

### Manual Installation

If you prefer step-by-step installation:

```bash
# Clone the repository
git clone git@github.com:kevinjqiu/vimmy.git
cd vimmy

# Create symbolic links
make link

# Install vim-plug
make bootstrap

# Open vim and install plugins
vim +PlugInstall +qall
```

## Post-Installation

### Install Language Servers

CoC will auto-install most language servers on first use, but you can manually install them:

```vim
:CocInstall coc-pyright coc-tsserver coc-rust-analyzer coc-go
```

### Install Additional Tools

For the best experience, install these optional tools:

```bash
# ripgrep - for fast text search
# Ubuntu/Debian
sudo apt install ripgrep

# macOS
brew install ripgrep

# fzf - fuzzy finder (installed via vim-plug, but CLI tool is useful)
# Ubuntu/Debian
sudo apt install fzf

# macOS
brew install fzf
```

## Key Mappings

### Leader Key
`,` (comma) is the leader key

### File Navigation
- `<Leader>t` - Fuzzy find files (fzf)
- `<Leader>b` - Switch buffers
- `<Leader>h` - Recent files history
- `<Leader>g` - Search text with ripgrep
- `<F2>` - Toggle NERDTree
- `<Leader>r` - Find current file in NERDTree
- `<F3>` - Toggle Tagbar

### Code Navigation (CoC)
- `gd` - Go to definition
- `gy` - Go to type definition
- `gi` - Go to implementation
- `gr` - Find references
- `K` - Show documentation
- `[g` / `]g` - Navigate diagnostics
- `<Leader>rn` - Rename symbol
- `<Leader>qf` - Quick fix current issue

### Code Completion
- `<Tab>` - Next completion item
- `<Shift-Tab>` - Previous completion item
- `<CR>` - Confirm completion
- `<C-Space>` - Trigger completion

### CoC Lists
- `<Space>a` - Show all diagnostics
- `<Space>c` - Show commands
- `<Space>o` - Document outline
- `<Space>s` - Search workspace symbols

### Window Navigation
- `<C-h>` / `<C-l>` - Move between vertical splits
- `<C-j>` / `<C-k>` - Move between horizontal splits

### Tab Navigation
- `t1` - `t9` - Switch to tab 1-9
- `<C-u>` - Previous tab
- `<C-p>` - Next tab
- `<Leader>T` - New tab

### Other
- `<Leader>w` - Toggle show whitespace
- `jj` - Exit insert mode (alternative to ESC)
- `<Leader><Space>` - Clear search highlight
- `:W` / `:Q` / `:Wq` - Work even with shift key stuck

## Configuration Structure

```
vimmy/
├── vimrc                    # Main configuration file
└── vim/                     # Configuration modules
    ├── 00-bundles.vim      # Plugin definitions (vim-plug)
    ├── 10-keymappings.vim  # Key mappings
    ├── 20-airline.vim      # Airline statusline config
    ├── 20-coc.vim          # CoC completion config
    ├── 20-colorscheme.vim  # Color scheme settings
    ├── 20-fzf.vim          # FZF fuzzy finder config
    ├── 20-go.vim           # Go language settings
    ├── 20-nerdtree.vim     # NERDTree file explorer config
    └── 20-ruby.vim         # Ruby language settings
```

## Customization

### Local Overrides

Create `~/.vimrc.local` for machine-specific settings that won't be tracked by git:

```vim
" Example: Different colorscheme on work machine
colorscheme dracula

" Example: Custom settings for work projects
set tabstop=2 shiftwidth=2
```

### Change Colorscheme

Edit `vim/20-colorscheme.vim` and uncomment your preferred theme:

```vim
" colorscheme gruvbox     " Current default
colorscheme dracula       " Uncomment this line
" colorscheme everforest
" colorscheme catppuccin_mocha
```

## Upgrading

### Update Plugins

```vim
:PlugUpdate
```

### Update vim-plug Itself

```vim
:PlugUpgrade
```

### Clean Unused Plugins

```vim
:PlugClean
```

## Migration from Old Setup

This configuration has been modernized from:
- **NeoBundle** → **vim-plug** (better maintained, simpler)
- **CtrlP** → **fzf.vim** (much faster, better UX)
- **neocomplete** → **CoC.nvim** (modern LSP support)
- Old colorschemes → Modern alternatives

The key mappings remain mostly the same for muscle memory compatibility.

## Troubleshooting

### CoC not working

1. Check CoC status: `:CocInfo`
2. Check CoC logs: `:CocOpenLog`
3. Reinstall CoC extensions: `:CocInstall coc-pyright coc-tsserver`

### Plugins not installing

```vim
:PlugInstall
:PlugUpdate
```

### FZF not working

Make sure `fzf` and `ripgrep` are installed on your system.

## License

Free to use and modify as needed.

## Credits

Created and maintained by [kevinjqiu](https://github.com/kevinjqiu)
