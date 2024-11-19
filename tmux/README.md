# TMUX Configuration

This repository contains a custom `tmux.conf` configuration file tailored for improved workflow, efficient pane navigation, and enhanced usability.

## Features

- **Custom Key Bindings:**
  - Split panes:
    - Horizontal: `<prefix> _`
    - Vertical: `<prefix> -`
  - Navigate between panes:
    - Left: `<prefix> h`
    - Down: `<prefix> j`
    - Up: `<prefix> k`
    - Right: `<prefix> l`
  - Quickly switch windows:
    - Previous: `<prefix> y`
    - Next: `<prefix> C-n`
  - Resize panes using:
    - `<prefix> <` (move window left)
    - `<prefix> >` (move window right)

- **Session Management:**
  - Reload configuration: `<prefix> r`
  - Attach session with default command: `<prefix> C-m`

- **Clipboard Integration:**
  - Copy mode: `<prefix> Escape`
  - Paste buffer: `<prefix> p`
  - Copy selected text with system clipboard (`pbcopy` on macOS).

- **UI Improvements:**
  - Enhanced status bar:
    - Style: Yellow text on a black background.
    - Displays current time in the format `HH:MM:SS`.
  - Base index starts at `1` for windows and panes.

- **Other Settings:**
  - Focus events enabled for better terminal integration.
  - Default shell set to Zsh.
  - History limit increased to 50,000 lines.
  - Escape time set to `0` for faster responsiveness.

## Installation

1. Clone this repository or download the `tmux.conf` file.
2. Place the file in your home directory:
   ```bash
   mv tmux.conf ~/.tmux.conf
