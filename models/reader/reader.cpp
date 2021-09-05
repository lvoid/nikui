#include "reader.h"

Reader::Reader() {}

void Reader::openFiles(QStringList fileList)
{
    for(int fileIndex = 0; fileIndex < fileList.count(); fileIndex++) {
        QString currentFilePath = fileList.at(fileIndex);

        if (currentFilePath.endsWith(".cbz") || currentFilePath.endsWith(".zip")) {
            /* If the user selected a .zip or .cbz, select only the first file */
            if(fileExists(currentFilePath)) {
                extractCbzFile(currentFilePath);
            }
            else {
                /* Possible URI is missing a "/", append one and check if it works */
                QString ammendedFilePath = "/" + currentFilePath;

                if(fileExists(ammendedFilePath)) {
                    extractCbzFile(ammendedFilePath);
                }
                else {
                    qDebug() << "ERROR: File not found.  Check URI:" << ammendedFilePath;
                }
            }
        }
        else if (currentFilePath.endsWith(".png") || currentFilePath.endsWith(".jpg")
                 || currentFilePath.endsWith(".jpeg")) {
            /* TODO: If the user selected a(n) image, send the full list */

        }

    }
}

bool Reader::fileExists(QString path) {
    QFileInfo check_file(path);

    // check if file exists and if yes: Is it really a file and no directory?
    if (check_file.exists() && check_file.isFile()) {
        return true;
    } else {
        return false;
    }
}

bool Reader::extractCbzFile(QString cbzFile)
{   
    QStringList allFiles = JlCompress::extractDir(cbzFile);

    QImage newImage;
    for(int file = 0; file < allFiles.size(); file++) {
        QImageReader reader(allFiles[file]);
        newImage = reader.read();

        if(newImage.isNull()) return false;

        m_mangaImages.push_back(newImage); //save image to class variable
    }

    qDebug() << m_mangaImages.size();
    return true;
}
