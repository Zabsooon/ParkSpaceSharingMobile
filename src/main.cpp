#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "include/login.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<LoginClass>("com.example", 1, 0, "LoginClass");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/ParkSpaceSharingMobile/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
