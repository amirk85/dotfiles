#!/bin/bash

set -euo pipefail

# Define Pacman packages
PACMAN_PACKAGES=(
    # Shell & terminal
    zsh tmux tree zathura man-db man-pages autotiling firefox
    pulsemixer flameshot pacman-contrib stow dunst fastfetch
    fzf bat ripgrep fd btop xclip xrandr curl wget git python docker docker-compose
    go gopls nvm mpv vlc pavucontrol xorg-xrandr xorg-xkbutils picom
		imagemagick libjpeg-turbo libpng libtiff lazygit unzip

    # Neovim & related tools
    neovim lua-language-server nodejs npm clang gcc

    # Network and desktop utilities
    network-manager-applet nautilus

    # Window manager & desktop tools
    i3 rofi feh ghostty elisa zoxide

		# creative tools
		krita gimp obs-studio kdenlive
)

# Define AUR packages
AUR_PACKAGES=(
    visual-studio-code-bin hsphfpd ani-cli
    hsphfpd-git jmtpfs lazydocker
)

# Ensure yay is installed
install_yay() {
    if ! command -v yay &>/dev/null; then
        echo "🔧 Installing yay..."
        sudo pacman -S --needed --noconfirm base-devel git
        git clone https://aur.archlinux.org/yay.git
        (cd yay && makepkg -si --noconfirm)
        rm -rf yay
    fi
}

# Install Pacman packages
install_pacman_packages() {
    echo "📦 Installing Pacman packages..."
    sudo pacman -Syu --noconfirm
    for pkg in "${PACMAN_PACKAGES[@]}"; do
        echo "➡️  $pkg"
        sudo pacman -S --needed --noconfirm "$pkg" || echo "⚠️  Failed to install $pkg"
    done
}

# Install AUR packages
install_aur_packages() {
    echo "📦 Installing AUR packages..."
    for pkg in "${AUR_PACKAGES[@]}"; do
        echo "➡️  $pkg"
        yay -S --needed --noconfirm "$pkg" || echo "⚠️  Failed to install $pkg"
    done
}

# Main
main() {
    install_yay
    install_pacman_packages
    install_aur_packages
    echo "✅ All packages processed!"
}

main
