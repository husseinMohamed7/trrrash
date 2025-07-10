
#!/bin/bash

# Check if running in Bash
if [ -z "$BASH_VERSION" ]; then
    echo "This installer must be run using Bash."
    exit 1
fi

# Save current directory path
SCRIPT_DIR="$(pwd)"

# Ensure the trash folder exists
TRASH_DIR="$HOME/.trrrash"
if [ ! -d "$TRASH_DIR" ]; then
    mkdir -p "$TRASH_DIR"
    echo "Created trash folder at $TRASH_DIR"
fi

# Make trrrash executable
chmod +x trrrash
echo "Made 'trrrash' executable."

# Ask to add this folder to PATH
read -p "Do you want to add this directory to your PATH permanently? (y/n): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    if grep -Fxq "export PATH=\"\$PATH:$SCRIPT_DIR\"" ~/.bashrc; then
        echo "Directory is already in PATH."
    else
        echo "export PATH=\"\$PATH:$SCRIPT_DIR\"" >> ~/.bashrc
        echo "Added this directory to PATH in ~/.bashrc"
    fi

    source ~/.bashrc
    echo "Installation complete. You can now use 'trrrash' from any location."
else
    echo "Installation complete. You can run 'trrrash' from this folder or add it to PATH manually."
fi
