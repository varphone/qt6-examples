#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char** argv)
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    qputenv("QT_DEBUG_PLUGINS", QByteArray("2"));

    QApplication a(argc, argv);

    QQmlApplicationEngine engine;
    auto url = QUrl("qrc:/examples/main.qml");
    engine.load(url);

    return a.exec();
}
