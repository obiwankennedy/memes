#include "qmlmanager.h"

QmlManager::QmlManager() {}

QQuickWindow* QmlManager::window() const
{
    return m_window;
}

void QmlManager::setWindow(QQuickWindow* window)
{
    m_window= window;
}

void QmlManager::currentPageHasChanged()
{
    if(!m_window)
        return;
    m_window->update();
    QImage img= m_window->grabWindow();

    if(img.isNull())
        return;

    static int count= 0;

    img.save(tr("/home/renaud/screens/%1_screen.png").arg(++count, 4, 10, QChar('0')), "png");
}
