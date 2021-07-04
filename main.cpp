#include "nikui.h"

#include <QApplication>
#include <QDir>
#include <QDateTime>
#include <QTextStream>
#include <QQmlApplicationEngine>
#include <QScopedPointer>
#include <QQmlContext>
#include <QPixmap>
#include <QSplashScreen>
#include <QIcon>

const QString logDirectory = "logs";

void delay(){
    QTime dieTime= QTime::currentTime().addSecs(2);
    while (QTime::currentTime() < dieTime)
        QCoreApplication::processEvents(QEventLoop::AllEvents, 100);
}

static void createLoggingDirectory() {
    if(!QDir(logDirectory).exists()) {
        QDir().mkdir(logDirectory);
    }
}

static QString generateLogFileLabel() {
    QDate today = QDate::currentDate();
    QString relativeFileName("");

    relativeFileName.append(QString::number(today.month()));
    relativeFileName.append("-");

    relativeFileName.append(QString::number(today.day()));
    relativeFileName.append("-");

    relativeFileName.append(QString::number(today.year()));

    return relativeFileName;
}

void nikuiMessageOutput(QtMsgType type, const QMessageLogContext& context, const QString& msg) {
    Q_UNUSED(context)

    QString dt = QDateTime::currentDateTime().toString("dd/MM/yyyy hh:mm:ss");
    QString txt = QString("[%1] ").arg(dt);

    switch(type)
    {
    case QtDebugMsg:
        txt += QString("{Debug} \t\t %1").arg(msg);
        break;

    case QtInfoMsg:
        txt += QString("{Info} \t %1").arg(msg);
        break;

    case QtWarningMsg:
        txt += QString("{Warning} \t %1").arg(msg);
        break;

    case QtCriticalMsg:
        txt += QString("{Critical} \t %1").arg(msg);
        break;

    case QtFatalMsg:
        txt += QString("{Fatal} \t\t %1").arg(msg);
        abort();
    }

    QFile outFile(logDirectory + "/" + generateLogFileLabel());
    outFile.open(QIODevice::WriteOnly | QIODevice::Append);

    QTextStream textStream(&outFile);

    // Ignore QML layout warnings
    if(!msg.contains("Cannot anchor") && !msg.contains("Detected anchors") && !msg.contains("QML"))  {
        textStream << txt << endl;
    }
}

int main(int argc, char *argv[])
{
    createLoggingDirectory();

    QApplication app(argc, argv);

    QApplication::setApplicationName("Nikui");
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication::setWindowIcon(QIcon(":/res/icons/logo.png"));

    QScopedPointer<Nikui> nikui(new Nikui());

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/res/qml/nikui.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                         &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QApplication::exit(-1);
        }, Qt::QueuedConnection);

    QPixmap pixmap(":/res/icons/splash.png");
    QSplashScreen splash(pixmap);
    splash.show();
    delay();
    splash.hide();

    engine.rootContext()->setContextProperty("nikui", nikui.data());
    engine.load(url);

    return app.exec();
}
