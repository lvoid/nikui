#include "database.h"

Database::Database() : Database("nikui.sqlite"){}

Database::Database(QString databaseFile)
{
    try {
        qDebug() << LOG_ID
                 << "Initializing SQLITE database";
    }
    catch(const std::exception& e) {
        qWarning() << LOG_ID
                   << "Could not initialize SQLITE database"
                   << e.what();
    }
}

Database::~Database()
{
    QString connection = m_db.connectionName();
    m_db.close();
    m_db = QSqlDatabase();
    m_db.removeDatabase(connection);
}
