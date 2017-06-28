#include "myinputcontext.h"

MyInputContext::MyInputContext()
{
}


bool MyInputContext::filterEvent(const QEvent* event)
{
    if (event->type() == QEvent::RequestSoftwareInputPanel) {
        emit calledSoftwareInputOpen();
        return true;
    } else if (event->type() == QEvent::CloseSoftwareInputPanel) {
        emit calledSoftwareInputClose();
        return true;
    }
    return false;
}

QString MyInputContext::identifierName()
{
    return "MyInputPanelContext";
}

void MyInputContext::reset()
{
}

bool MyInputContext::isComposing() const
{
    return false;
}

QString MyInputContext::language()
{
    return "en_US";
}
