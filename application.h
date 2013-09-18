#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>
#include "localizer.h"
#include <QTimer>

class Application : public QObject
{
    Q_OBJECT
public:
    explicit Application(QObject *parent = 0);
    Localizer* loc;
    QTimer* timer;
    int counts;
    Q_INVOKABLE void Start(int hours,int secs, bool player, bool radio, bool internet);
    Q_INVOKABLE void Stop();
    Q_INVOKABLE void Hide();
    bool iPlayer;
    bool iRadio;
    bool iInternet;

signals:
    void updateUi(int h, int m);
public slots:
    void Tick();
};

#endif // APPLICATION_H
