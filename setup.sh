#!/bin/bash
set -e

echo "🚀 Setting up Oh My Zsh with custom config..."

# Check if required tools are installed
check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "❌ Error: $1 is not installed"
        echo ""
        echo "Please install $1 first:"
        echo ""
        echo "  macOS:        brew install $1"
        echo "  Ubuntu/Debian: sudo apt install $1"
        echo "  Fedora:       sudo dnf install $1"
        echo ""
        echo "Then run this script again."
        exit 1
    fi
}

check_command zsh
check_command git
check_command curl

# Create temp directory for setup
SETUP_DIR="/tmp/omz-setup-install"

# Clone or update the repo
if [ -d "$SETUP_DIR/.git" ]; then
    echo "Updating omz-setup repo..."
    cd "$SETUP_DIR" && git pull
else
    # Remove old directory if it exists but isn't a git repo
    if [ -d "$SETUP_DIR" ]; then
        rm -rf "$SETUP_DIR"
    fi
    mkdir -p "$SETUP_DIR"
    cd "$SETUP_DIR"
    echo "Cloning omz-setup repo..."
    git clone https://github.com/MauriceDHanisch/omz-setup.git .
fi

# Install Oh My Zsh if not already installed
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
fi

# Install plugins
echo "Installing zsh plugins..."
PLUGINS_DIR=~/.oh-my-zsh/custom/plugins

# zsh-autosuggestions
if [ ! -d "$PLUGINS_DIR/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGINS_DIR/zsh-autosuggestions"
fi

# zsh-syntax-highlighting
if [ ! -d "$PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGINS_DIR/zsh-syntax-highlighting"
fi

# Install custom theme
echo "Installing custom theme..."
cp "$SETUP_DIR/setup_omz/mhanisch.zsh-theme" ~/.oh-my-zsh/themes/

# Install .zshrc
echo "Installing custom .zshrc..."
cp "$SETUP_DIR/setup_omz/.zshrc" ~/.zshrc

# Clean up temp directory
echo "Cleaning up temporary files..."
cd ~
rm -rf "$SETUP_DIR"

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Restart your shell: exec zsh"
echo "  2. Verify plugins work by typing and using arrow keys (autosuggestions)"
echo "  3. Your custom theme 'mhanisch' is now active"
echo ""
echo "Installed:"
echo "  ✓ Oh My Zsh framework"
echo "  ✓ zsh-autosuggestions plugin"
echo "  ✓ zsh-syntax-highlighting plugin"
echo "  ✓ mhanisch theme"
echo "  ✓ Custom .zshrc configuration"
