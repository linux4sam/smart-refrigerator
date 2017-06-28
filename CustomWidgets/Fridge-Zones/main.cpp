#include <QtGlobal>
#if (QT_VERSION >= QT_VERSION_CHECK(5,0,0))
#include <QApplication>
#else
#include <QtGui/QApplication>
#endif // (QT_VERSION >= QT_VERSION_CHECK(5,0,0))

#include "qmlapplicationviewer.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
#if (QT_VERSION >= 0x050000)
    QScopedPointer<QApplication> app(new QApplication(argc, argv));
#else
    QScopedPointer<QApplication> app(createApplication(argc, argv));
#endif // (QT_VERSION >= 0x050000)
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
#if (QT_VERSION >= 0x050000)
    viewer.setMainQmlFile(QLatin1String("qrc:///qml/FridgeZones/main.qml"));
#else
    viewer.setSource(QUrl("qrc:/qml/FridgeZones/main.qml"));
#endif // (QT_VERSION >= 0x050000)
    viewer.showExpanded();

    return app->exec();
}
