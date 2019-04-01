#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>

#include "qmlmanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QmlManager managaer;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QList<QObject*> roots = engine.rootObjects();
    QObject* root = roots.at(0);
    auto window = qobject_cast<QQuickWindow*>(root);
    if(nullptr != window)
    {
        managaer.setWindow(window);
        QObject::connect(root,SIGNAL(currentItemChanged()),&managaer,SLOT(currentPageHasChanged()),Qt::QueuedConnection);
    }
    return app.exec();
}
