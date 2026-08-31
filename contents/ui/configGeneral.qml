/**
 * Spatium - GNOME-like virtual desktops switcher for Plasma 6
 * SPDX-FileCopyrightText: 2024 Sakib Reza
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import QtQuick.Dialogs
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    id: root
    
    property alias cfg_dotSizeCustom: dotSizeSpin.value
    property alias cfg_activeSizeW: activeWidthSpin.value
    property alias cfg_activeSizeH: activeHeightSpin.value
    property alias cfg_desktopWrapOn: wrapCheck.checked
    property alias cfg_middleButtonCommand: middleCommand.text
    property alias cfg_customColorsEnabled: customColorsCheck.checked
    property string cfg_activeColor
    property string cfg_inactiveColor
    property alias cfg_animationDuration: animationSpin.value
    property alias cfg_canAddDesktops: addDesktopsCheck.checked
    property alias cfg_spacingFactor: spacingSpin.realValue
    property alias cfg_dotShape: dotShapeCombo.currentIndex
    property alias cfg_fixedDotCountEnabled: fixedDotCountCheck.checked
    property alias cfg_fixedDotCount: fixedDotCountSpin.value

    Kirigami.Heading {
        Kirigami.FormData.isSection: true
        text: i18n("Appearance")
    }

    QQC2.ComboBox {
        id: dotShapeCombo
        Kirigami.FormData.label: i18n("Shape:")
        model: [i18n("Circle"), i18n("Square"), i18n("Desktop Name")]
        Component.onCompleted: currentIndex = plasmoid.configuration.dotShape || 0
    }

    QQC2.SpinBox {
        id: dotSizeSpin
        Kirigami.FormData.label: i18n("Dot Size (px):")
        from: 8; to: 16
        enabled: dotShapeCombo.currentIndex < 2
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
        enabled: dotShapeCombo.currentIndex < 2
    }

    QQC2.SpinBox {
        id: activeHeightSpin
        Kirigami.FormData.label: i18n("Active Height (px):")
        from: 8; to: 16
        enabled: dotShapeCombo.currentIndex < 2
    }

    Kirigami.Heading {
    Kirigami.FormData.isSection: true
    text: i18n("Colors")
}

    QQC2.CheckBox {
        id: customColorsCheck
        Kirigami.FormData.label: i18n("Custom Colors:")
        text: i18n("Use custom colors")
    }

    function normalizeToHex(colorString) {
        var c = Qt.color(colorString)
        if (c.valid) {
            var r = Math.round(c.r * 255).toString(16).padStart(2, '0')
            var g = Math.round(c.g * 255).toString(16).padStart(2, '0')
            var b = Math.round(c.b * 255).toString(16).padStart(2, '0')
            return '#' + r + g + b
        }
        return '#ffffff'
    }

    RowLayout {
        Kirigami.FormData.label: i18n("Active Color:")
        visible: customColorsCheck.checked
        spacing: Kirigami.Units.smallSpacing

        Rectangle {
            width: 24; height: 24; radius: 4
            color: Qt.color(cfg_activeColor).valid ? cfg_activeColor : "#ffffff"
            border.color: Kirigami.Theme.separatorColor
            border.width: 1
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    activeColorDialog.selectedColor = Qt.color(cfg_activeColor)
                    activeColorDialog.open()
                }
            }
        }

        QQC2.TextField {
            id: activeColorField
            Layout.preferredWidth: 90
            placeholderText: "#RRGGBB"
            Component.onCompleted: text = root.normalizeToHex(cfg_activeColor)
            onEditingFinished: {
                var c = Qt.color(text)
                if (c.valid) cfg_activeColor = root.normalizeToHex(text)
            }
        }
    }

    RowLayout {
        Kirigami.FormData.label: i18n("Inactive Color:")
        visible: customColorsCheck.checked
        spacing: Kirigami.Units.smallSpacing

        Rectangle {
            width: 24; height: 24; radius: 4
            color: Qt.color(cfg_inactiveColor).valid ? cfg_inactiveColor : "#808080"
            border.color: Kirigami.Theme.separatorColor
            border.width: 1
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    inactiveColorDialog.selectedColor = Qt.color(cfg_inactiveColor)
                    inactiveColorDialog.open()
                }
            }
        }

        QQC2.TextField {
            id: inactiveColorField
            Layout.preferredWidth: 90
            placeholderText: "#RRGGBB"
            Component.onCompleted: text = root.normalizeToHex(cfg_inactiveColor)
            onEditingFinished: {
                var c = Qt.color(text)
                if (c.valid) cfg_inactiveColor = root.normalizeToHex(text)
            }
        }
    }

    ColorDialog {
        id: activeColorDialog
        onAccepted: {
            var hex = root.normalizeToHex(selectedColor.toString())
            cfg_activeColor = hex
            activeColorField.text = hex
        }
    }

    ColorDialog {
        id: inactiveColorDialog
        onAccepted: {
            var hex = root.normalizeToHex(selectedColor.toString())
            cfg_inactiveColor = hex
            inactiveColorField.text = hex
        }
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

    QQC2.CheckBox {
        id: fixedDotCountCheck
        Kirigami.FormData.label: i18n("Fixed Dot Count:")
        text: i18n("Show a fixed number of dots")
    }

    QQC2.SpinBox {
        id: fixedDotCountSpin
        Kirigami.FormData.label: i18n("Number of dots:")
        from: 1; to: 20
        enabled: fixedDotCountCheck.checked
    }
}