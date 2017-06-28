#ifndef WEBBRIDGE_H
#define WEBBRIDGE_H

#include <QObject>

class WebBridge : public QObject
{
    Q_OBJECT
public:
    explicit WebBridge(QObject *parent = 0);
    
signals:
    
public slots:
    QString openInputContext(const QString& orgtext);
    
};

#endif // WEBBRIDGE_H
