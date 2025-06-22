#!/bin/bash

# Define Pacman packages
PACMAN_PACKAGES=(
    # Shell & terminal
    zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search
    tmux
    pulsemixer
		pacman-contrib
		stow
		dunst
		rmpc
    fastfetch
    fzf
    bat
    ripgrep
    fd
    btop
		xclip
		xrandr
    curl
    wget
    git
    python
    go
    gopls
    nvm
		mpv
		vlc

    # Neovim & related tools
    neovim
    lua-language-server
    nodejs npm
    clang   # For C/C++ LSP and Treesitter parsers that need compilation
    gcc     # For building various tools

    # Window manager & desktop tools
    i3
    rofi
    feh
    ghostty
    elisa
    zoxide
)

# Define AUR packages
AUR_PACKAGES=(
    visual-studio-code-bin
		nautilus
)

# Install yay if not present
if ! command -v yay &>/dev/null; then
    echo "yay not found. Installing yay..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit 1
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Function: Install Pacman packages
install_pacman_packages() {
    echo "Updating system and installing Pacman packages..."
    sudo pacman -Syu --noconfirm
    for pkg in "${PACMAN_PACKAGES[@]}"; do
        echo "Installing $pkg..."
        sudo pacman -S --needed --noconfirm "$pkg" || echo "⚠️ Failed to install $pkg, skipping..."
    done
}

# Function: Install AUR packages
install_aur_packages() {
    echo "Installing AUR packages..."
    for pkg in "${AUR_PACKAGES[@]}"; do
        echo "Installing $pkg..."
        yay -S --needed --noconfirm "$pkg" || echo "⚠️ Failed to install $pkg, skipping..."
    done
}

# Run
install_pacman_packages
install_aur_packages

echo "✅ All packages processed!"
