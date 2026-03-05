/**
 * Spatium - GNOME-like virtual desktops switcher for Plasma 6
 * SPDX-FileCopyrightText: 2024 Sakib Reza
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    id: root
    
    property alias cfg_dotSizeCustom: dotSizeSpin.value
    property alias cfg_activeSizeW: activeWidthSpin.value
    property alias cfg_activeSizeH: activeHeightSpin.value
    property alias cfg_desktopWrapOn: wrapCheck.checked
    property alias cfg_middleButtonCommand: middleCommand.text
    property alias cfg_customColorsEnabled: customColorsCheck.checked
    property alias cfg_activeColor: activeColorCombo.currentValue
    property alias cfg_inactiveColor: inactiveColorCombo.currentValue
    property alias cfg_animationDuration: animationSpin.value
    property alias cfg_canAddDesktops: addDesktopsCheck.checked
    property alias cfg_spacingFactor: spacingSpin.realValue

    Kirigami.Heading {
        Kirigami.FormData.isSection: true
        text: i18n("Appearance")
    }

    QQC2.SpinBox {
        id: dotSizeSpin
        Kirigami.FormData.label: i18n("Dot Size (px):")
        from: 8; to: 16
    }

    QQC2.SpinBox {
        id: spacingSpin
        Kirigami.FormData.label: i18n("Spacing Factor:")
        from: 1; to: 6; stepSize: 1
        property real realValue: value / 10.0
        textFromValue: (value, locale) => Number(value / 10.0).toLocaleString(locale, 'f', 1)
        valueFromText: (text, locale) => Math.round(Number.fromLocaleString(locale, text) * 10)
    }

    QQC2.SpinBox {
        id: activeWidthSpin
        Kirigami.FormData.label: i18n("Active Width (px):")
        from: 8; to: 64
    }

    QQC2.SpinBox {
        id: activeHeightSpin
        Kirigami.FormData.label: i18n("Active Height (px):")
        from: 8; to: 16
    }

    Kirigami.Heading {
    Kirigami.FormData.isSection: true
    text: i18n("Colors")
}

QQC2.CheckBox {
    id: customColorsCheck
    Kirigami.FormData.label: i18n("Custom Colors:")
    text: i18n("Use preset colors")
}

readonly property var colorPresets: ["white", "red", "blue", "green", "purple", "orange", "pink", "yellow", "cyan", "gray"]

QQC2.ComboBox {
    id: activeColorCombo
    Kirigami.FormData.label: i18n("Active Color:")
    visible: customColorsCheck.checked
    model: root.colorPresets
    // This ensures the combo box shows the saved value on open
    Component.onCompleted: currentIndex = Math.max(0, model.indexOf(plasmoid.configuration.activeColor))
}

QQC2.ComboBox {
    id: inactiveColorCombo
    Kirigami.FormData.label: i18n("Inactive Color:")
    visible: customColorsCheck.checked
    model: root.colorPresets
    Component.onCompleted: currentIndex = Math.max(0, model.indexOf(plasmoid.configuration.inactiveColor))
}

    Kirigami.Heading {
        Kirigami.FormData.isSection: true
        text: i18n("Behavior")
    }

    QQC2.CheckBox {
        id: wrapCheck
        Kirigami.FormData.label: i18n("Scrolling:")
        text: i18n("Wrap around desktops")
    }

    QQC2.SpinBox {
        id: animationSpin
        Kirigami.FormData.label: i18n("Animation (ms):")
        from: 0; to: 1000; stepSize: 50
    }

    QQC2.TextField {
        id: middleCommand
        Kirigami.FormData.label: i18n("Middle Click Command:")
        placeholderText: "e.g. krunner"
        Layout.fillWidth: true
    }

    QQC2.CheckBox {
        id: addDesktopsCheck
        Kirigami.FormData.label: i18n("Desktop Management:")
        text: i18n("Allow adding/removing via context menu")
    }
}