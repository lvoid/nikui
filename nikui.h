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

private slots:
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
    void scaleImage(double factor);
    void adjustScrollBar(QScrollBar* scrollBar, double factor);

    QLabel* imageLabel;
    QScrollArea* scrollArea;

    QAction* zoomInAct;
    QAction* zoomOutAct;
    QAction* normalSizeAct;
    QAction* fitToWindowAct;
};

#endif // NIKUI_H
