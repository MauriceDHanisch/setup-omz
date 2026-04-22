# omz-setup

Install Oh My Zsh with custom theme and plugins in one command.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/MauriceDHanisch/setup-omz/main/setup.sh | bash
exec zsh
```

## What Gets Installed

- Oh My Zsh framework
- Plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`
- Theme: `mhanisch`
- Custom `.zshrc` configuration

## Requirements

- `zsh`, `git`, `curl` (script checks and guides if missing)

## Troubleshooting

**Theme not showing?**
```bash
exec zsh
```

**Zsh not found?**
```bash
# macOS
brew install zsh

# Ubuntu/Debian
sudo apt install zsh

# Then restart or set default
chsh -s $(which zsh)
```

**Update config:** Re-run the install command anytime to sync latest changes
