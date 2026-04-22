import os
import subprocess
import shutil

# Paths
OH_MY_ZSH_DIR = os.path.expanduser("~/.oh-my-zsh")
ZSHRC_PATH = os.path.expanduser("~/.zshrc")
REPO_DIR = os.path.dirname(__file__)

# Custom Configurations
THEME_NAME = "mhanisch"
ZSHRC_SRC = os.path.join(REPO_DIR, ".zshrc")
THEME_SRC = os.path.join(REPO_DIR, f"{THEME_NAME}.zsh-theme")
THEME_DEST = os.path.join(OH_MY_ZSH_DIR, "themes", f"{THEME_NAME}.zsh-theme")

def run_cmd(cmd):
    """Runs a shell command."""
    subprocess.run(cmd, shell=True, check=True)

def install_oh_my_zsh():
    """Installs Oh My Zsh if not already installed."""
    if not os.path.exists(OH_MY_ZSH_DIR):
        run_cmd("sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" --unattended")

def install_plugins():
    """Installs essential Zsh plugins."""
    plugins_dir = os.path.join(OH_MY_ZSH_DIR, "custom", "plugins")
    plugins = {
        "zsh-autosuggestions": "https://github.com/zsh-users/zsh-autosuggestions.git",
        "zsh-syntax-highlighting": "https://github.com/zsh-users/zsh-syntax-highlighting.git"
    }
    for name, url in plugins.items():
        plugin_path = os.path.join(plugins_dir, name)
        if not os.path.exists(plugin_path):
            run_cmd(f"git clone {url} {plugin_path}")

def setup_zshrc():
    """Copies the repo .zshrc to the user's home directory."""
    shutil.copy(ZSHRC_SRC, ZSHRC_PATH)

def install_theme():
    """Copies custom theme to Oh My Zsh themes directory."""
    shutil.copy(THEME_SRC, THEME_DEST)

def install_conda():
    """Installs Conda if not already installed and sets up shell integration."""
    conda_installed = shutil.which("conda") is not None
    if not conda_installed:
        print("Conda not found. Installing Miniconda...")
        run_cmd("curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh")
        run_cmd("bash miniconda.sh -b -p $HOME/miniconda")
        run_cmd("rm miniconda.sh")
        run_cmd("echo 'export PATH=$HOME/miniconda/bin:$PATH' >> ~/.zshrc")
    
    # Setup Conda shell integration
    run_cmd("conda init zsh")

def main():
    install_oh_my_zsh()
    install_plugins()
    setup_zshrc()
    install_theme()
    install_conda()
    print("Oh My Zsh setup completed. Restart your terminal to apply changes.")

if __name__ == "__main__":
    main()
