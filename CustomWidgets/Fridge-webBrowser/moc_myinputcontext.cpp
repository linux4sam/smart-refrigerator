/****************************************************************************
** Meta object code from reading C++ file 'myinputcontext.h'
**
** Created: Thu Nov 14 10:18:32 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "myinputcontext.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'myinputcontext.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_MyInputContext[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      16,   15,   15,   15, 0x05,
      42,   15,   15,   15, 0x05,

       0        // eod
};

static const char qt_meta_stringdata_MyInputContext[] = {
    "MyInputContext\0\0calledSoftwareInputOpen()\0"
    "calledSoftwareInputClose()\0"
};

void MyInputContext::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        MyInputContext *_t = static_cast<MyInputContext *>(_o);
        switch (_id) {
        case 0: _t->calledSoftwareInputOpen(); break;
        case 1: _t->calledSoftwareInputClose(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData MyInputContext::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MyInputContext::staticMetaObject = {
    { &QInputContext::staticMetaObject, qt_meta_stringdata_MyInputContext,
      qt_meta_data_MyInputContext, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MyInputContext::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MyInputContext::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MyInputContext::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MyInputContext))
        return static_cast<void*>(const_cast< MyInputContext*>(this));
    return QInputContext::qt_metacast(_clname);
}

int MyInputContext::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QInputContext::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void MyInputContext::calledSoftwareInputOpen()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void MyInputContext::calledSoftwareInputClose()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}
QT_END_MOC_NAMESPACE
