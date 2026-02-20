#!/bin/bash
# Kali Gemini Assistant Installation Script

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "🔧 Installing Kali Gemini Assistant..."

# Verifying Gemini
if ! command -v gemini-cli &> /dev/null; then

echo -e "${RED}❌ Gemini-CLI not installed. Installing...${NC}"

sudo apt update && sudo apt install -y gemini-cli
else

echo -e "${GREEN}✅ Gemini-CLI installed${NC}"
fi

# Install additional tools
echo "📦 Installing utilities..."
sudo apt install -y xclip xsel

# Create shortcuts
echo "⚡ Create quick shortcuts..."
sudo cp kali-gemini.sh /usr/local/bin/kgemini 2>/dev/null
sudo chmod +x /usr/local/bin/kgemini

# ghelp shortcut
sudo tee /usr/local/bin/ghelp << 'EOF'
#!/bin/bash
gemini-cli "How do I use $1 in Kali Linux? Give me practical examples"
EOF
sudo chmod +x /usr/local/bin/ghelp

# gmap shortcut
sudo tee /usr/local/bin/gmap << 'EOF'
#!/bin/bash
echo "🔍 Nmap scan for target: $1"
nmap -sV -sC -O "$1"
EOF
sudo chmod +x /usr/local/bin/gmap

# Hide warnings
echo 'export NODE_NO_WARNINGS=1' >> ~/.zshrc 2>/dev/null
echo 'export NODE_NO_WARNINGS=1' >> ~/.bashrc 2>/dev/null

echo -e "${GREEN}✅ Installation complete!${NC}"
echo "🚀 Run helper with: kgemini"
echo "💡 Shortcuts: ghelp <tool> - gmap <target>"
