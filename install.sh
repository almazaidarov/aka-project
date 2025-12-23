#!/bin/bash
set -e

echo "🔍 Checking Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed"
fi

echo "🔍 Installing GNU grep..."
brew install grep

echo "🔍 Installing tfenv..."
if [ ! -d "$HOME/.tfenv" ]; then
  git clone https://github.com/tfutils/tfenv.git ~/.tfenv
else
  echo "✅ tfenv already exists"
fi

# Add tfenv to PATH (zsh)
if ! grep -q tfenv ~/.zshrc 2>/dev/null; then
  echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.zshrc
fi

export PATH="$HOME/.tfenv/bin:$PATH"

echo "🔍 Installing Terraform latest version..."
tfenv install latest
tfenv use latest

echo "🎉 Installation complete!"
terraform version
