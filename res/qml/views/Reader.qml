import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import "../items"

ColumnLayout {
    Layout.alignment: Layout.Center

    RowLayout {
        Layout.alignment: Layout.Center
        spacing: 40

        /* Reader left buttons */
        ColumnLayout {

            ColumnLayout {
                spacing: readerButtonSpacing

                ReaderButton {
                    id: bookmarkButton
                    iconPath: "../../icons/bookmark.png"
                }

                ReaderButton {
                    id: libraryButton
                    iconPath: "../../icons/library.png"
                }

                ReaderButton {
                    id: dictionaryButton
                    iconPath: "../../icons/dictionary.png"
                }
            }

            ColumnLayout {

            }

        }

        /* Reader and Progress Bar */
        ColumnLayout {

            Rectangle {
                id: readerRectangle
                color: "white"
                radius: 15

                Layout.preferredHeight: 800
                Layout.preferredWidth: 850

                Image {
                    id: galleryImage
                    source: "../../icons/tg.jpg"
                    height: parent.height
                    width: parent.width
                    anchors.centerIn: parent

                    /* Create circular crop around image icon using profilePicture as mask */
                    fillMode: Image.PreserveAspectCrop
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: readerRectangle
                    }
                }
            }

            Slider {
                id: mangaProgressSlider

                Layout.preferredWidth: readerRectangle.width

                from: 1
                to: 100
                value: 25

                background: Rectangle {
                    x: mangaProgressSlider.leftPadding
                    y: mangaProgressSlider.topPadding + mangaProgressSlider.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 4
                    width: mangaProgressSlider.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: "#bdbebf"

                    Rectangle {
                        width: mangaProgressSlider.visualPosition * parent.width
                        height: parent.height
                        color: dashboardButtonColor
                        radius: 2
                    }
                }

                handle: Rectangle {
                    x: mangaProgressSlider.leftPadding + mangaProgressSlider.visualPosition * (mangaProgressSlider.availableWidth - width)
                    y: mangaProgressSlider.topPadding + mangaProgressSlider.availableHeight / 2 - height / 2
                    implicitWidth: 26
                    implicitHeight: 26
                    radius: 13
                    color: dashboardButtonColor
                    border.color: "#bdbebf"
                }
            }

        }

        /* Reader right buttons */
        ColumnLayout {

            /* Zoom In/Zoom Out buttons */
            ColumnLayout {
                Layout.alignment: Qt.AlignBottom
                spacing: readerButtonSpacing

                ReaderButton {
                    id: zoomInButton
                    iconPath: "../../icons/zoom_in.png"
                }

                ReaderButton {
                    id: zoomOutButton
                    iconPath: "../../icons/zoom_out.png"
                }

            }

            /* Filler Column */
            ColumnLayout {

            }

            /* Read Style and Theme switches */
            ColumnLayout {
                Layout.alignment: Qt.AlignBottom
                spacing: readerButtonSpacing

                /* Read Style Switch */
                ColumnLayout {

                    Text {
                        text: "Read Style"
                        font.pixelSize: readerSwitchTextSize
                    }

                    Switch {
                        id: readStyleSwitch

                        indicator: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 50
                            y: parent.height / 2 - height / 2
                            radius: readerSwitchRadius
                            color: readStyleSwitch.checked ? dashboardButtonColor : "#ffffff"
                            border.color: readStyleSwitch.checked ? "#41d2fa" : "#cccccc"

                            Rectangle {
                                x: readStyleSwitch.checked ? parent.width - width : 0
                                width: 50
                                height: 50
                                radius: readerSwitchRadius
                                color: readStyleSwitch.down ? "#cccccc" : "#ffffff"
                                border.color: readStyleSwitch.checked ? (readStyleSwitch.down ? dashboardButtonColor : "#41d2fa") : "#999999"
                            }
                        }

                    }

                }

                /* Theme Switch */
                ColumnLayout {

                    Text {
                        text: "Dark Mode"
                        font.pixelSize: readerSwitchTextSize
                    }

                    Switch {
                        id: darkModeSwitch

                        indicator: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 50
                            y: parent.height / 2 - height / 2
                            radius: readerSwitchRadius
                            color: darkModeSwitch.checked ? dashboardButtonColor : "#ffffff"
                            border.color: darkModeSwitch.checked ? "#41d2fa" : "#cccccc"

                            Rectangle {
                                x: darkModeSwitch.checked ? parent.width - width : 0
                                width: 50
                                height: 50
                                radius: readerSwitchRadius
                                color: darkModeSwitch.down ? "#cccccc" : "#ffffff"
                                border.color: darkModeSwitch.checked ? (darkModeSwitch.down ? dashboardButtonColor : "#41d2fa") : "#999999"
                            }
                        }
                    }

                }
            }
        }
    }
}
