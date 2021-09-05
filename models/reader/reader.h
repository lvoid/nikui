#include <QObject>
#include <QImage>
#include <QImageReader>
#include <QDebug>

#include <quazip/quazip.h>
#include <quazip/JlCompress.h>

class Reader : public QObject
{
    Q_OBJECT

public:
    Reader();

public slots:
    void openFiles(QStringList fileList);

private:
    bool extractCbzFile(QString cbzFile);

    bool fileExists(QString path);

    QList<QImage> m_mangaImages;
};
