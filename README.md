# Spatium — GNOME-style Virtual Desktop Indicator for Plasma 6

**Spatium** is a lightweight, GNOME-inspired virtual desktop switcher built specifically for **KDE Plasma 6**. It provides a clean, minimal dot-based interface to navigate your workspaces with support for custom colors, animations, and mouse-wheel scrolling.

![Spatium Preview](preview.png)

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
   git clone https://github.com/sakibreza229/org.kde.plasma.spatium.git
   cd org.kde.plasma.spatium

2. Run the included install script:

```Bash
chmod +x install.sh
./install.sh
```

### The Manual Way
1. Ensure the metadata.json is in the root of the folder.

2. Copy the entire folder to your Plasma plasmoids directory:

```Bash
cp -r org.kde.plasma.spatium ~/.local/share/plasma/plasmoids/
```
3. Refresh the Plasma shell:

```Bash
kbuildsycoca6
```

## Configuration
Right-click the widget and select "Configure Spatium..."

## Requirements
- KDE Plasma 6.0+
- Plasma 5 Support (for the executable data engine)

## License
This project is licensed under the GPL-3.0+ License.
