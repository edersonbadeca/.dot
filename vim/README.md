# Vim Configuration

This repository contains a comprehensive `vimrc` configuration file, designed to enhance your Vim experience with robust plugin integration, improved workflows, and powerful coding features.

## Features

### Plugin Management
- **Plugin Manager:** [vim-plug](https://github.com/junegunn/vim-plug) is used for managing plugins.
- **Included Plugins:**
  - **General Enhancements:**
    - `vim-airline` and `vim-airline-themes` for a modern statusline.
    - `NERDTree` for a file explorer.
    - `fzf` and `fzf.vim` for fuzzy file searching.
    - `tagbar` for code outline navigation.
    - `copilot.vim` for AI-assisted coding.
    - `base16-vim` for themes.
    - `vim-signature` to show marks and breakpoints.
  - **Language-Specific Support:**
    - `coc.nvim` for autocomplete and LSP support.
    - `python-mode` for Python development.
    - `terraform plugins` for Terraform syntax and auto-formatting.
    - `nvim-lspconfig`, `nvim-cmp`, and `mason.nvim` for LSP and auto-completion.
  - **Additional Utilities:**
    - `telescope.nvim` for powerful fuzzy searching.
    - `null-ls.nvim` for custom diagnostics and code actions.
    - `vim-go` and `gopher.nvim` for Go development.

### General Settings
- **Performance Improvements:**
  - Disabled swap files for faster startup.
  - Increased history to 1000 commands.
  - Clipboard integration for seamless copy-paste.
- **UI Enhancements:**
  - Dark mode enabled (`background=dark`).
  - Line numbers enabled.
  - Highlighted search results.
  - `base16` colorspace for better theme support.

## Key Bindings

### General Navigation
| Key Combination          | Action                                      |
|---------------------------|---------------------------------------------|
| `<Ctrl-h>`               | Move to the left split                     |
| `<Ctrl-j>`               | Move to the bottom split                   |
| `<Ctrl-k>`               | Move to the top split                      |
| `<Ctrl-l>`               | Move to the right split                    |
| `vv`                     | Create a vertical split                    |
| `ss`                     | Create a horizontal split                  |
| `<leader>h`              | Increase vertical split size               |
| `<leader>k`              | Decrease vertical split size               |

### File Management
| Key Combination          | Action                                      |
|---------------------------|---------------------------------------------|
| `<Ctrl-s>`               | Save file                                  |
| `<leader>f`              | Open `.vimrc`                              |
| `<leader>ff`             | Reload `.vimrc`                            |
| `<leader>m`              | Toggle NERDTree                            |
| `<leader>r`              | Refresh NERDTree                           |
| `<leader>n`              | Focus NERDTree                             |

### Tab and Buffer Management
| Key Combination          | Action                                      |
|---------------------------|---------------------------------------------|
| `gT`                     | Go to previous tab                         |
| `gt`                     | Go to next tab                             |
| `H`                      | Go to the previous buffer                  |
| `tt`                     | Close current buffer without saving         |
| `<Ctrl-q>`               | Close current buffer                       |
| `!!`                     | Close all buffers                          |
| `<Ctrl-!>`               | Close all buffers except current           |

### Fuzzy Search (Telescope)
| Key Combination          | Action                                      |
|---------------------------|---------------------------------------------|
| `<leader>a`              | Open Telescope                             |
| `<leader>p`              | Open file history                          |
| `<Ctrl-p>`               | Fuzzy find files                           |
| `<Ctrl-o>`               | Show key mappings                          |
| `<Ctrl-f>`               | Search text using live grep                |

### Git Integration
| Key Combination          | Action                                      |
|---------------------------|---------------------------------------------|
| `<F9>`                   | Open Git log                               |
| `<F2>`                   | Open Git status                            |

### Code Formatting and Linting
| Key Combination          | Action                                      |
|---------------------------|---------------------------------------------|
| `<Leader>y`              | Run Python lint auto                       |
| `<Leader>yg`             | Run Python lint                            |
| `<Leader>yr`             | Reformat Python code                       |

### Debugging (Vimspector)
| Key Combination          | Action                                      |
|---------------------------|---------------------------------------------|
| `<Leader>dt`             | Toggle breakpoint                          |
| `<Leader>dT`             | Clear all breakpoints                      |
| `<Leader>dk`             | Restart debugging                          |
| `<Leader>dh`             | Step out of the current function           |
| `<Leader>dl`             | Step into the function                     |
| `<Leader>dj`             | Step over the current line                 |
| `<Leader>ds`             | Stop debugging                             |

### Search and Highlights
| Key Combination          | Action                                      |
|---------------------------|---------------------------------------------|
| `<Leader>c`              | Clear search highlights                    |
| `<Leader>ag`             | Search using Ag with ignored directories   |

### Miscellaneous
| Key Combination          | Action                                      |
|---------------------------|---------------------------------------------|
| `<Leader>x`              | Display current file name                  |
| `<Leader>t`              | Switch Python version                      |
| `<Leader>is`             | Import sort (Python)                       |
| `<Leader><Space>`        | Open Telescope                             |
| `<Ctrl-x>`               | Close quickfix window                      |

## Installation

1. Clone this repository or download the `vimrc` file.
2. Place the file in your home directory as `.vimrc`:
   ```bash
   mv vimrc ~/.vimrc
