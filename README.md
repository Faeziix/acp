# acp - Advanced Copy

A smarter file copying tool that enhances the standard `cp` command with interactive directory selection using `zoxide` and `fzf`.

## Features

- **Smart Directory Selection**: Leverage `zoxide` to quickly access frequently used directories
- **Interactive Browsing**: Use `fzf` to browse and select destinations visually
- **Multiple Modes**: Choose between zoxide integration, filesystem browsing, or manual path entry
- **Persistent Configuration**: Set your preferred default mode for a streamlined workflow
- **Batch Operations**: Copy multiple files at once to your selected destination

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/acp.git
cd acp
```

2. Make the script executable:
```bash
chmod +x acp
```

3. Add to your PATH:
```bash
# Add to ~/.bashrc or ~/.zshrc
export PATH="$PATH:/path/to/acp"
```

### Dependencies

- `zoxide` - Smarter cd command ([Installation](https://github.com/ajeetdsouza/zoxide#installation))
- `fzf` - Command-line fuzzy finder ([Installation](https://github.com/junegunn/fzf#installation))
- Standard Unix tools: `find`, `grep`, `cut`, `sed`

## Usage

```bash
acp [options] <file1> [file2] ... [fileN]
```

### Options

- `-z, --zoxide` - Use zoxide for destination selection
- `-b, --browse` - Browse filesystem from current directory
- `-h, --home` - Browse filesystem from home directory
- `-m, --manual` - Specify destination manually: `acp -m <file> <destination>`
- `--set-default MODE` - Set default mode (zoxide, browse, home, manual)
- `--help` - Show help message

### Examples

```bash
# Interactive mode (shows menu if no default is set)
acp document.pdf

# Use zoxide to select from frequently visited directories
acp -z *.txt

# Browse from current directory
acp --browse README.md config.json

# Browse from home directory
acp -h important.doc

# Manual mode with explicit destination
acp -m file.txt ~/Downloads
acp -m script.sh /tmp

# Set default mode
acp --set-default zoxide
```

## Configuration

### Setting a Default Mode

You can set a default mode to skip the interactive menu:

1. **Using the command**:
```bash
acp --set-default zoxide  # or browse, home, manual
```

2. **Environment variable**:
```bash
export ACP_DEFAULT_MODE=browse
```

3. **Config file** (`~/.acprc`):
```bash
default_mode=zoxide
```

Priority order: Environment variable > Config file > Interactive menu

## Modes Explained

### Zoxide Mode (`-z`)
Presents a list of your most frequently accessed directories using zoxide's database. Perfect for quickly copying files to project directories you work with regularly.

### Browse Mode (`-b`)
Opens an interactive file browser starting from your current directory. Automatically excludes common build/cache directories like `node_modules`, `.git`, `__pycache__`, etc.

### Home Mode (`-h`)
Similar to browse mode but starts from your home directory. Useful when you need to copy files to directories outside your current project.

### Manual Mode (`-m`)
Direct path specification without any interactive selection. Supports path expansion (e.g., `~`, `../`, etc.).

## Tips

- The tool automatically adds selected destinations to zoxide's database, making them easier to access in the future
- Use tab completion with manual mode for faster path entry
- Set your most commonly used mode as default to save time

## License

MIT License - see LICENSE file for details

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.