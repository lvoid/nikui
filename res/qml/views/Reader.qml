import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import "../items"

ColumnLayout {
    Layout.alignment: Layout.Center

    RowLayout {
        Layout.alignment: Layout.Center
        spacing: 50

        /* Reader left buttons */
        ColumnLayout {

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

        /* Reader */
        ColumnLayout {
            // For now, place a rectangle in the center.
        }

        /* Reader right buttons */
        ColumnLayout {

            /* Zoom In/Zoom Out buttons */
            ColumnLayout {

                ReaderButton {
                    id: zoomInButton
                    iconPath: "../../icons/zoom_in.png"
                }

                ReaderButton {
                    id: zoomOutButton
                    iconPath: "../../icons/zoom_out.png"
                }
            }

            /* Read Style and Theme switches */
            ColumnLayout {

            }
        }
    }
}
