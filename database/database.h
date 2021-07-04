#include <QObject>
#include <QDebug>

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>

class Database : public QObject
{
    Q_OBJECT

public:
    Database();
    Database(QString databaseFile);
    ~Database();

private:
    const char* LOG_ID = "[Database]";

    QSqlDatabase m_db;
};
