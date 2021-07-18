import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.0

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
                id: profilePicture
                height: 200
                width: height
                Layout.preferredHeight: 200
                Layout.preferredWidth: 200

                Layout.alignment: Layout.Center


                onClicked: {
                    chooseProfilePicDialog.visible = true
                }


                contentItem: Image {
                    id: profilePictureImage
                    source: "../../icons/profile.png"
                    Layout.preferredHeight: 200
                    Layout.preferredWidth: 200
                    anchors.centerIn: parent

                    /* Create circular crop around image icon using profilePicture as mask */
                    fillMode: Image.PreserveAspectCrop
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: profilePicture
                    }
                }

                FileDialog {
                    id: chooseProfilePicDialog
                    visible: false

                    onAccepted: {
                        profilePictureImage.source = chooseProfilePicDialog.fileUrl
                    }

                    nameFilters: ["Image (*.png *.jpeg *.jpg)"]
                }
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
                        nikuiStackView.push(Qt.resolvedUrl("Reader.qml"))
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
                        nikuiStackView.push(Qt.resolvedUrl("Reader.qml"))
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
                        nikuiStackView.push(Qt.resolvedUrl("Library.qml"))
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
                        nikuiStackView.push(Qt.resolvedUrl("Settings.qml"))
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
