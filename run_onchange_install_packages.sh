#!/bin/sh
sudo apt update
sudo apt upgrade
sudo apt install -y fish eza zoxide ripgrep tealdeer micro

# Install jujutsu from GitHub releases
JJ_TAG=$(curl -fsSL "https://api.github.com/repos/martinvonz/jj/releases/latest" | grep '"tag_name"' | cut -d'"' -f4)
JJ_TMP=$(mktemp -d)
curl -fsSL "https://github.com/martinvonz/jj/releases/download/${JJ_TAG}/jj-${JJ_TAG}-x86_64-unknown-linux-musl.tar.gz" \
  | tar -xz -C "$JJ_TMP"
sudo install -m 755 "$JJ_TMP/jj" /usr/local/bin/jj
rm -rf "$JJ_TMP"

# Register fish as a valid login shell, then make it the default
FISH_PATH="$(which fish)"
grep -qxF "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells > /dev/null
sudo chsh -s "$FISH_PATH" "$(whoami)"

echo "exec fish" >> ~/.bashrc

exec "$FISH_PATH"
