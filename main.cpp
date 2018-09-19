#include "nikui.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Nikui w;
    w.show();

    return a.exec();
}
