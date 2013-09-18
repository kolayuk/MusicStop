/****************************************************************************
** Meta object code from reading C++ file 'application.h'
**
** Created: Wed 10. Oct 20:10:45 2012
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../application.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'application.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Application[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      17,   13,   12,   12, 0x05,

 // slots: signature, parameters, type, tag, flags
      35,   12,   12,   12, 0x0a,

 // methods: signature, parameters, type, tag, flags
      75,   42,   12,   12, 0x02,
     105,   12,   12,   12, 0x02,
     112,   12,   12,   12, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_Application[] = {
    "Application\0\0h,m\0updateUi(int,int)\0"
    "Tick()\0hours,secs,player,radio,internet\0"
    "Start(int,int,bool,bool,bool)\0Stop()\0"
    "Hide()\0"
};

const QMetaObject Application::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Application,
      qt_meta_data_Application, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Application::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Application::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Application::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Application))
        return static_cast<void*>(const_cast< Application*>(this));
    return QObject::qt_metacast(_clname);
}

int Application::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: updateUi((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 1: Tick(); break;
        case 2: Start((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3])),(*reinterpret_cast< bool(*)>(_a[4])),(*reinterpret_cast< bool(*)>(_a[5]))); break;
        case 3: Stop(); break;
        case 4: Hide(); break;
        default: ;
        }
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void Application::updateUi(int _t1, int _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
