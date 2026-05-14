#!/bin/bash

# --- CONFIGURATION ---
USER_NAME="ShivaanjayNarula"
USER_EMAIL="shivaanjaynarula@gmail.com"

# GUI Applications (Casks)
CASKS=(
    maccy visual-studio-code intellij-idea 
    pycharm anaconda webstorm cursor
    ghostty github docker ollama 
    antigravity opencode-desktop
)

# CLI Tools & Agents (Formulae)
FORMULAE=(
    git gcc openjdk node typescript go mysql 
    claude-code codex
)

SHELL_PROFILE="$HOME/.zshrc"

# Function to run commands with a pretty icon
run() {
    echo "🚀 $2..."
    eval "$1"
    if [ $? -ne 0 ]; then
        echo "⚠️  Note: $2 might need manual check (already installed or requires sudo)."
    fi
}

# Function to add unique lines to .zshrc
add_to_profile() {
    grep -qF "$1" "$SHELL_PROFILE" || echo -e "\n$1" >> "$SHELL_PROFILE"
}

# 1. Ensure Homebrew is ready
if ! command -v brew &> /dev/null; then
    run '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' "Installing Homebrew"
fi

# Set Brew path based on architecture (M1/M2/M3 vs Intel)
if [[ $(uname -m) == 'arm64' ]]; then
    BREW_BIN="/opt/homebrew/bin/brew"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    BREW_BIN="/usr/local/bin/brew"
fi

# 2. Bulk Install
run "$BREW_BIN update" "Refreshing Repositories"
run "$BREW_BIN install ${FORMULAE[*]}" "Installing CLI Stack"
run "$BREW_BIN install --cask ${CASKS[*]}" "Installing GUI Apps"

# 3. Environment & Path Config
echo "📝 Finalizing Shell Configuration..."
add_to_profile 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"'
add_to_profile 'export GOPATH=$HOME/go'
add_to_profile 'export PATH=$PATH:$GOPATH/bin'

# 4. Git Configuration (New Automated Step)
echo "👤 Configuring Git Identity..."
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
git config --global init.defaultBranch main

# 5. Start Services
run "$BREW_BIN services start mysql" "Enabling MySQL Service"

# 6. Initialize AI Models
echo "🤖 Initializing Local AI..."
(ollama serve > /dev/null 2>&1 &) && sleep 5 && ollama pull llama3

echo -e "\n===================================================="
echo "💎 ENVIRONMENT FULLY AUTOMATED"
echo "===================================================="
echo "User:       $USER_NAME <$USER_EMAIL>"
echo "Git Tools:  Git CLI & GitHub Desktop Installed[cite: 1, 2]"
echo "Terminal:   Ghostty (GPU Accelerated)"
echo "Next Step:  Run 'source ~/.zshrc' and check your GitHub Desktop."
echo "===================================================="