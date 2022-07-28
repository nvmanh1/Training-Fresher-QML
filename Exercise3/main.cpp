#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "model.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);




//    qmlRegisterType<MemModel>("org.example", 1, 0, "DataEntryModel");
    QQmlApplicationEngine engine;



    qmlRegisterType<MemModel>("custom.model", 1, 0, "MyMemModel");


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
