# Dotfiles Management with GNU Stow

This repository contains my dotfiles, managed using [GNU Stow](https://www.gnu.org/software/stow/), a symlink manager that simplifies configuration across multiple environments.

## Installation

1. Clone the repository to your home directory or any preferred location:

   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Ensure `stow` is installed:

   ```bash
   sudo pacman -S stow  # For Arch Linux
   ```

## Usage

To create symlinks for specific configurations, run:

```bash
stow <package>
```

For example, to manage your `nvim` and `zsh` configurations:

```bash
stow nvim
stow zsh
```

This will create symlinks from `~/.dotfiles/nvim` to `~/.config/nvim` (or `~/.dotfiles/zsh` to `~/.zshrc` if structured correctly).

### Removing Symlinks

To remove symlinks created by `stow`, use:

```bash
stow -D <package>
```

Example:

```bash
stow -D nvim
```

## Directory Structure

Organize dotfiles in package directories:

```
.dotfiles/
├── nvim/
│   ├── .config/nvim/init.lua
├── zsh/
│   ├── .zshrc
├── git/
│   ├── .gitconfig
```

Each package should mirror the home directory structure to ensure proper symlink creation.

## Best Practices

- Use meaningful package names (e.g., `nvim`, `zsh`, `git`)
- Always `cd` into `~/.dotfiles` before running `stow`
- Verify symlinks with `ls -l`
- Use `stow -D` before modifying package files to prevent conflicts

## Updating Configurations

When updating dotfiles:

1. Modify files inside `~/.dotfiles/<package>/`
2. Push changes to your repository:

   ```bash
   git add .
   git commit -m "Update dotfiles"
   git push
   ```

3. Re-stow if necessary:

   ```bash
   stow <package>
   ```

## Backup & Restore

To apply your dotfiles on a new system:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow <package>
```
