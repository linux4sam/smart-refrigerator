#include <QtGlobal>
#if (QT_VERSION >= QT_VERSION_CHECK(5,0,0))
#include <QApplication>
#else
#include <QtGui/QApplication>
#endif // (QT_VERSION >= QT_VERSION_CHECK(5,0,0))
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"
#include "mydeclarativewebview.h"
#include "myinputcontext.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    MyInputContext *aic = new MyInputContext();
    app->setInputContext(aic);

    qmlRegisterType<MyQDeclarativeWebView>("MyQDeclarativeWebView", 1, 0, "MyQDeclarativeWebView");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/FridgeEpi/main.qml"));

    QDeclarativeContext *ctxt = viewer.rootContext();
    ctxt->setContextProperty("serviceInputClass", aic);

    viewer.showExpanded();
    // viewer.showFullScreen();

    return app->exec();
}
