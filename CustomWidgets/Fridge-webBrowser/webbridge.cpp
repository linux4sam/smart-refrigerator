#include "webbridge.h"
#include <QInputDialog>

WebBridge::WebBridge(QObject *parent) :
    QObject(parent)
{
}

QString WebBridge::openInputContext(const QString &orgtext)
{
       QString text = QInputDialog::getText(NULL, "Input Box", "Enter your text");
       return (!text.isNull()) ? text : orgtext;
}


