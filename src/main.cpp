#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "include/login.h"
#include "include/register.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<LoginClass>("com.example.login", 1, 0, "LoginClass");
    qmlRegisterType<RegisterClass>("com.example.register", 1, 0, "RegisterClass");

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
