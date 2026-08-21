# Knome Workspaces — GNOME-style Virtual Desktop Switcher for Plasma 6

**Knome Workspaces** is a lightweight, GNOME-inspired virtual desktop switcher built specifically for **KDE Plasma 6**. It provides a clean, minimal dot-based interface to navigate your workspaces with support for custom colors, animations, and mouse-wheel scrolling.

![Knome Workspaces Preview](preview.png)

## Features

* **Minimalist UI**: Clean dots that expand to bars for the active desktop.
* **Highly Customizable**: Adjust dot sizes, spacing, and active dimensions.
* **Hex Color Support**: Input custom hex codes for precise branding.
* **Desktop Management**: Add or remove virtual desktops directly via the context menu.
* **Scrolling Support**: Switch desktops using the mouse wheel with optional wrap-around.
* **Plasma 6 Ready**: Uses the latest Kirigami and Plasma 6 APIs.

## Installation

### The Easy Way (Automated)
1. Clone the repository:
   ```bash
   git clone https://github.com/sakibreza229/org.kde.plasma.knome-workspaces.git
   cd org.kde.plasma.knome-workspaces
   ```

2. Run the included install script:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

### The Manual Way
1. Ensure the `metadata.json` is in the root of the folder.

2. Copy the entire folder to your Plasma plasmoids directory:
   ```bash
   cp -r org.kde.plasma.knome-workspaces ~/.local/share/plasma/plasmoids/
   ```
3. Refresh the Plasma shell:
   ```bash
   kbuildsycoca6
   ```

## Configuration
Right-click the widget and select **"Configure Knome Workspaces..."**

## Requirements
- KDE Plasma 6.0+
- Plasma 5 Support (for the executable data engine)

## License
This project is licensed under the GPL-3.0+ License.
```

---

## Key Changes Made:

| Before | After |
|--------|-------|
| Spatium | **Knome Workspaces** |
| `org.kde.plasma.spatium` | `org.kde.plasma.knome-workspaces` |
| "Configure Spatium..." | **"Configure Knome Workspaces..."** |
| Spatium Preview | **Knome Workspaces Preview** |
