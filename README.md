# Kali Gemini Assistant

<div align="center">

<img src="https://img.shields.io/badge/Kali_Linux-557C94?style=for-the-badge&logo=kali-linux&logoColor=white"/>
<img src="https://img.shields.io/badge/Gemini-8E75B2?style=for-the-badge&logo=google&logoColor=white"/>
<img src="https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white"/>

<br/>
<br/>

**A lightweight, high-speed Kali Linux assistant powered by the Gemini API — built for ethical security professionals.**

</div>

---

## Features

| Feature | Description |
|---|---|
| 🚀 **Blazing Speed** | Instant responses via the Gemini API |
| 🛡️ **Comprehensive Coverage** | All major Kali Linux tools in one interface |
| 💬 **Interactive Chat** | Free-form conversation with Gemini |
| ⚡ **Smart Shortcuts** | Quick aliases for the most commonly used tools |
| 📝 **Save & Export** | Save responses and export them as reports |
| 🔧 **Extensible** | Easily add new tools and custom features |

---

## Requirements

- Kali Linux (any version)
- `gemini-cli` — install via `sudo apt install gemini-cli`
- Node.js (installed automatically as a dependency of `gemini-cli`)

---

## Installation

```bash
# 1. Clone the repository
git clone https://github.com/zerolinux-os/kali-gemini-assistant.git
cd kali-gemini-assistant

# 2. Run the installer
chmod +x install.sh
./install.sh

# 3. Launch the assistant
kgemini
```

---

## Usage

### Main Menu

```
1. 🛡️  Reconnaissance Tools
2. 🔍  Vulnerability Analysis Tools
3. 💻  Exploitation Tools
4. 🔑  Password Attack Tools
5. 🌐  Web Application Testing
6. 📡  Networking Tools
7. 📝  Custom Script Writing
8. 💬  Free Chat with Gemini
9. ⚙️  Advanced Settings
0. ❌  Exit
```

### Quick Shortcuts

```bash
# Get an explanation for any tool
ghelp nmap

# Run a quick scan
gmap 192.168.1.1

# Start an interactive chat session
gemini -i
```

### In-Session Commands

| Command | Action |
|---|---|
| `save` | Save the last response to a file |
| `copy` | Copy the response to clipboard |
| `run` | Execute the first suggested command |
| `back` | Return to the main menu |

---

## Project Structure

```
kali-gemini-assistant/
├── kali-gemini.sh      # Main script
├── install.sh          # Installation script
├── README.md           # Documentation
├── LICENSE             # MIT License
└── config/
    ├── aliases.conf    # Custom shortcuts
    └── tools.conf      # Tools configuration
```

---

## Contributing

Contributions are welcome. To submit a change:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/YourFeature`
3. Commit your changes: `git commit -m 'Add YourFeature'`
4. Push the branch: `git push origin feature/YourFeature`
5. Open a Pull Request

---

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## Disclaimer

> This project is intended for **educational purposes only**. The user is solely responsible for how these tools are used. Always ensure you have proper authorization before performing any security testing.

---

## Developer

**Zero** — [@zerolinux-os](https://github.com/zerolinux-os)

## Acknowledgments

- [Kali Linux Team](https://www.kali.org/)
- [Google Gemini](https://gemini.google.com/)
- Arab Cybersecurity Community

---

<div align="center">
  If you find this project useful, please consider giving it a ⭐
</div>
