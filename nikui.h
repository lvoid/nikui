#ifndef NIKUI_H
#define NIKUI_H

#include "models/library/library.h"
#include "models/reader/reader.h"
#include "models/settings/settings.h"
#include "database/database.h"

#include <QObject>

class Nikui : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Reader* reader READ reader CONSTANT)
    Q_PROPERTY(Library* library READ library CONSTANT)
    Q_PROPERTY(Settings* settings READ settings CONSTANT)

public:
    Nikui();

public slots:
    Reader* reader();
    Library* library();
    Settings* settings();

private:
    Reader* m_reader;
    Library* m_library;
    Settings* m_settings;
    Database* m_database;
};

#endif // NIKUI_H
