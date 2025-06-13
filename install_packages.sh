#!/bin/bash

# Define the list of packages
PACMAN_PACKAGES=(
    "neovim"
		"rofi"
		"zsh"
		"pulsemixer"
		"zsh-completions"
		"zsh-syntax-highlighting"
		"zsh-autosuggestions"
		"zsh-history-substring-search"
    "git"
		"curl"
		"wget"
		"python"
		"nvm"
		"go"
		"gopls"
    "htop"
		"fastfetch"
    "zsh"
    "fzf"
    "bat"
    "ripgrep"
    "fd"
    "tmux"
    "i3"
		"ghostty"
		"elisa"
		"rofi"
		"feh"
		"zoxide"
)

AUR_PACKAGES=(
    "brave-bin"
    "visual-studio-code-bin"
		"neulitus"
)

# Install yay if not found
if ! command -v yay &> /dev/null; then
    echo "yay not found. Installing yay..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit 1
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Function to install pacman packages
install_pacman_packages() {
    echo "Updating system and installing Pacman packages..."
    sudo pacman -Syu --noconfirm  # Update system

    for pkg in "${PACMAN_PACKAGES[@]}"; do
        echo "Installing $pkg..."
        sudo pacman -S --noconfirm --needed "$pkg" || echo "Failed to install $pkg, skipping..."
    done
}

# Function to install AUR packages
install_aur_packages() {
    echo "Installing AUR packages..."
    for pkg in "${AUR_PACKAGES[@]}"; do
        echo "Installing $pkg..."
        yay -S --noconfirm --needed "$pkg" || echo "Failed to install $pkg, skipping..."
    done
}

# Run installations
install_pacman_packages
install_aur_packages

echo "All packages processed!"
