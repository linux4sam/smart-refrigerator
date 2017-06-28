#ifndef MYINPUTCONTEXT_H
#define MYINPUTCONTEXT_H

#include <QInputContext>

class MyInputContext : public QInputContext
{
    Q_OBJECT
public:
    MyInputContext();

    bool filterEvent(const QEvent* event);
    QString identifierName();
    QString language();

    bool isComposing() const;

    void reset();

signals:
        void calledSoftwareInputOpen();
        void calledSoftwareInputClose();
};

#endif // MYINPUTCONTEXT_H
