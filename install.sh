#!/bin/bash

# Configuration
PLASMOID_NAME="org.kde.plasma.spatium"
INSTALL_DIR="$HOME/.local/share/plasma/plasmoids/$PLASMOID_NAME"

echo "--- Starting Installation for $PLASMOID_NAME ---"

# 1. Ensure metadata.json is in the root
if [ -f "contents/metadata.json" ]; then
    echo "Moving metadata.json to root directory..."
    mv contents/metadata.json .
fi

# 2. Create local directory if it doesn't exist
mkdir -p "$HOME/.local/share/plasma/plasmoids/"

# 3. Handle previous installations
if [ -d "$INSTALL_DIR" ]; then
    echo "Removing old installation..."
    rm -rf "$INSTALL_DIR"
fi

# 4. Copy files to the local plasmoids folder
echo "Copying files to $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
cp -r contents metadata.json "$INSTALL_DIR/"

# 5. Refresh Plasma's plugin cache
echo "Refreshing Plasma cache..."
kbuildsycoca6

# 6. Restart Plasma (Optional/Safe alternative)
# Instead of restarting the whole shell, we just notify the system
dbus-send --type=method_call --dest=org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.refreshCurrentShell

echo "--- Installation Complete! ---"
echo "You can now add 'Spatium' to your panel or desktop."