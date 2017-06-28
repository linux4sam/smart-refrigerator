#include <QtGlobal>
#if (QT_VERSION >= QT_VERSION_CHECK(5,0,0))
#include <QApplication>
#else
#include <QtGui/QApplication>
#endif // (QT_VERSION >= QT_VERSION_CHECK(5,0,0))

#include <QDeclarativeProperty>
#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
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
    viewer.setMainQmlFile(QLatin1String("qml/webbrowser/webbrowser.qml"));
    QDeclarativeContext *ctxt = viewer.rootContext();
    ctxt->setContextProperty("serviceInputClass", aic);

    QObject* object = (QObject*)(viewer.rootObject());
    QDeclarativeProperty property(object, QString("urlString"));
    property.write(argv[1]);

    // viewer.showFullScreen();
    // qApp->setOverrideCursor( QCursor( Qt::BlankCursor ) );
    viewer.show();

    return app->exec();
}
