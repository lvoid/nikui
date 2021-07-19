import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: nikuiApplicationWindow
    visible: true

    color: dashboardBackgroundColor
    title: qsTr("Nikui")

    property int applicationWidth: 1200
    property int applicationHeight: 900

    width: applicationWidth
    height: applicationHeight

    /* Window stays fixed size to avoid layout issues */
    minimumWidth: applicationWidth
    minimumHeight: applicationHeight
    maximumWidth: applicationWidth
    maximumHeight: applicationHeight

    /* Dashboard properties */
    property string dashboardBackgroundColor: "#E1E1E1"
    property string dashboardButtonColor: "#75f2ff"
    property string dashboardButtonColor_pressed: "#219eab"
    property string dashboardButtonTextColor: "#000000"
    property string dashboardButtonFontFamily: "Cambria"
    property int dashboardButtonIconSize: 80
    property int dashboardButtonFontSize: 60
    property int dashboardButtonHeight: 100
    property int dashboardButtonWidth: 500
    property int dashboardButtonRadius: 15

    /* Reader properties */
    property int readerButtonSize: 150
    property int readerButtonIconSize: 100
    property string readerButtonColor: dashboardButtonColor
    property string readerButtonColor_pressed: dashboardButtonColor_pressed

    ColumnLayout {
        id: dashboardColumnLayout
        anchors.fill: parent

        StackView {
            id: nikuiStackView

            initialItem: Qt.resolvedUrl("views/Dashboard.qml")

            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
