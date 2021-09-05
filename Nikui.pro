QT += quick
QT += sql
QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    database/database.cpp \
    main.cpp \
    models/library/library.cpp \
    models/reader/reader.cpp \
    models/settings/settings.cpp \
    nikui.cpp

HEADERS += \
    database/database.h \
    models/library/library.h \
    models/reader/reader.h \
    models/settings/settings.h \
    nikui.h

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


RESOURCES += \
    qml.qrc



unix:!macx: LIBS += -L$$PWD/../../../usr/local/lib/ -lqauzip1-qt5

INCLUDEPATH += $$PWD/../../../usr/local/include/QuaZip-Qt5-1.1
DEPENDPATH += $$PWD/../../../usr/local/include/QuaZip-Qt5-1.1

unix:!macx: LIBS += -L$$PWD/../../../usr/local/zlib/lib/ -lz

INCLUDEPATH += $$PWD/../../../usr/local/zlib/include
DEPENDPATH += $$PWD/../../../usr/local/zlib/include


