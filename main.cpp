#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle.h>

#include <QDebug>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qDebug() << "Windows list: " << QGuiApplication::allWindows();

    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    qDebug() << "Windows list again: " << QGuiApplication::allWindows();
    return app.exec();
}
