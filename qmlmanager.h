#ifndef QMLMANAGER_H
#define QMLMANAGER_H

#include <QQuickWindow>

class QmlManager : public QObject
{
    Q_OBJECT
public:
    QmlManager();


public slots:
    QQuickWindow *window() const;
    void setWindow(QQuickWindow *window);
    void currentPageHasChanged();

private:
    QQuickWindow* m_window = nullptr;
};


#endif // QMLMANAGER_H
