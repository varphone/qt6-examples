#include "BrushFactory.h"
#include "PointCloudModel.h"

#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char** argv)
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    qputenv("QT_DEBUG_PLUGINS", QByteArray("2"));

    QApplication a(argc, argv);

    qmlRegisterType<PointCloudModel>("simple", 1, 0, "PointCloudModel");
    qmlRegisterSingletonType<BrushFactory>("simple", 1, 0, "BrushFactory",
                                           &BrushFactory::qmlInstance);

    QQmlApplicationEngine engine;
    auto url = QUrl("qrc:/simple/qml/main.qml");
    engine.load(url);

    return a.exec();
}
