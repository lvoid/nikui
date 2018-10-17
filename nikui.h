#ifndef NIKUI_H
#define NIKUI_H

#include <QMainWindow>

class QScrollBar;
class QLabel;
class QScrollArea;

namespace Ui {
class Nikui;
}

class Nikui : public QMainWindow
{
    Q_OBJECT

public:
   Nikui();
    ~Nikui();
   bool loadFiles(const QStringList&);
   void initializeView();

private slots:
   void prevPage();
   void nextPage();
   void open();
   void zoomIn();
   void zoomOut();
   void normalSize();
   void fitToWindow();
   void about();

private:
    void createActions();
    void createMenus();
    void updateActions();
    void setImage(const QImage& newImage);
    void scaleImage(double factor);
    void adjustScrollBar(QScrollBar* scrollBar, double factor);
    void resizeEvent(QResizeEvent* event);

    QImage currentImage;
    QLabel* imageLabel;
    QScrollArea* scrollArea;
    std::vector<QImage> currentMangaFileList;
    unsigned int currentMangaFilePos;
    double scaleFactor;
    double widthFactor;
    double heightFactor;
    QPixmap thisPix;

    QAction* prevPageAct;
    QAction* nextPageAct;
    QAction* zoomInAct;
    QAction* zoomOutAct;
    QAction* normalSizeAct;
    QAction* fitToWindowAct;
};

#endif // NIKUI_H
