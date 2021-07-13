import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

ColumnLayout {
    Layout.alignment: Layout.Center

    RowLayout {
        Layout.alignment: Layout.Center
        spacing: 50

        /* Gallery area */
        ColumnLayout {
            Rectangle {
                color: "white"
                radius: 15
                height: 700
                width: 500
            }
        }

        /* Separator */
        ColumnLayout {
            Rectangle {
                color: dashboardButtonColor
                height: 700
                width: 2
            }
        }

        /* Profile and Buttons */
        ColumnLayout {
            spacing: 15

            RoundButton {
                height: 150
                width: height
                icon.source: "../../icons/profile.png"
                icon.height: 150
                icon.width: 150

                Layout.alignment: Layout.Center
            }

            Button {
                id: openButton

                Image {
                    id: openIcon
                    anchors.leftMargin: 20
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../icons/open.png"
                    sourceSize.height: dashboardButtonIconSize
                }

                MouseArea {
                    id: openButtonMouseArea
                    anchors.fill: parent

                    onClicked: {
                        console.log("User clicked on open")
                    }
                }

                contentItem: Text {
                    text: qsTr("Open")
                    font.pixelSize: dashboardButtonFontSize
                    font.family: dashboardButtonFontFamily
                    color: dashboardButtonTextColor
                    verticalAlignment: Text.AlignVCenter
                    anchors.left: openIcon.right
                    anchors.leftMargin: 70
                }

                background: Rectangle {
                    color: openButtonMouseArea.pressed ? dashboardButtonColor_pressed : dashboardButtonColor
                    radius: dashboardButtonRadius
                    implicitHeight: dashboardButtonHeight
                    implicitWidth: dashboardButtonWidth
                }

                Layout.alignment: Layout.Center

            }

            Button {
                id: continueButton

                Image {
                    id: continueIcon
                    anchors.leftMargin: 20
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../icons/bookmark.png"
                    sourceSize.height: dashboardButtonIconSize
                }

                MouseArea {
                    id: continueMouseArea
                    anchors.fill: parent

                    onClicked: {
                        console.log("User clicked on continue")
                    }
                }

                contentItem: Text {
                    text: qsTr("Continue")
                    font.pixelSize: dashboardButtonFontSize
                    font.family: dashboardButtonFontFamily
                    color: dashboardButtonTextColor
                    verticalAlignment: Text.AlignVCenter
                    anchors.left: continueIcon.right
                    anchors.leftMargin: 70
                }

                background: Rectangle {
                    color: continueMouseArea.pressed ? dashboardButtonColor_pressed : dashboardButtonColor
                    radius: dashboardButtonRadius
                    implicitHeight: dashboardButtonHeight
                    implicitWidth: dashboardButtonWidth
                }

                Layout.alignment: Layout.Center

            }

            Button {
                id: librarybutton

                Image {
                    id: libraryIcon
                    anchors.leftMargin: 20
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../icons/library.png"
                    sourceSize.height: dashboardButtonIconSize
                }

                MouseArea {
                    id: libraryMouseArea
                    anchors.fill: parent

                    onClicked: {
                        console.log("User clicked on library")
                    }
                }

                contentItem: Text {
                    text: qsTr("Library")
                    font.pixelSize: dashboardButtonFontSize
                    font.family: dashboardButtonFontFamily
                    color: dashboardButtonTextColor
                    verticalAlignment: Text.AlignVCenter
                    anchors.left: libraryIcon.right
                    anchors.leftMargin: 70
                }

                background: Rectangle {
                    color: libraryMouseArea.pressed ? dashboardButtonColor_pressed : dashboardButtonColor
                    radius: dashboardButtonRadius
                    implicitHeight: dashboardButtonHeight
                    implicitWidth: dashboardButtonWidth
                }

                Layout.alignment: Layout.Center

            }

            Button {
                id: settingsButton

                Image {
                    id: settingsIcon
                    anchors.leftMargin: 20
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../../icons/settings.png"
                    sourceSize.height: dashboardButtonIconSize
                }

                MouseArea {
                    id: settingsMouseArea
                    anchors.fill: parent

                    onClicked: {
                        console.log("User clicked on settings")
                    }
                }

                contentItem: Text {
                    text: qsTr("Settings")
                    font.pixelSize: dashboardButtonFontSize
                    font.family: dashboardButtonFontFamily
                    color: dashboardButtonTextColor
                    verticalAlignment: Text.AlignVCenter
                    anchors.left: settingsIcon.right
                    anchors.leftMargin: 70
                }

                background: Rectangle {
                    color: settingsMouseArea.pressed ? dashboardButtonColor_pressed : dashboardButtonColor
                    radius: dashboardButtonRadius
                    implicitHeight: dashboardButtonHeight
                    implicitWidth: dashboardButtonWidth
                }

                Layout.alignment: Layout.Center

            }

        }
    }
}
