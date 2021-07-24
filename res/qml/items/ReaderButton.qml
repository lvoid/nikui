import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

RoundButton {
    id: readerButton
    Layout.preferredHeight: readerButtonSize
    Layout.preferredWidth: readerButtonSize

    property string iconPath: ""

    background: Rectangle {
        radius: readerButton.radius
        color: readerButtonColor
        border.color: "black"

        Image {
            id: readerButtonIcon
            source: iconPath
            height: readerButtonIconSize
            width: readerButtonIconSize
            anchors.centerIn: parent
        }
    }
}
