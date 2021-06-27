#include "nikui.h"

#include <QApplication>
#include <QDir>
#include <QDateTime>
#include <QTextStream>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QScopedPointer>
#include <QQmlContext>

const QString logDirectory = "logs";

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

    QApplication::setApplicationName("Nikui");
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QScopedPointer<Nikui> nikui(new Nikui());

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/res/qml/nikui.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                         &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QApplication::exit(-1);
        }, Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("nikui", nikui.data());
    engine.load(url);

    return app.exec();
}
