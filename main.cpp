#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "application.h"
#include <QDeclarativeContext>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    QScopedPointer<QmlApplicationViewer> viewer(QmlApplicationViewer::create());

    Application* myapp=new Application();
    viewer->rootContext()->setContextProperty("application",myapp);
    viewer->rootContext()->setContextProperty("strings",myapp->loc->GetStringsAsList());

    viewer->setMainQmlFile(QLatin1String("qml/MusicStop/main.qml"));
    viewer->setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer->showExpanded();

    return app->exec();
}
