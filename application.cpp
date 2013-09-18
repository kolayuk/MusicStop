#include "application.h"

#ifdef Q_OS_SYMBIAN
#include <apgtask.h>
#include <eikenv.h>
#include <apparc.h>
#include <apgcli.h>
#include <aknappui.h>
#include <apgwgnam.h>
#include <akndoc.h>
#include <COEMAIN.H>
#endif
#include <QApplication>
Application::Application(QObject *parent) :
    QObject(parent)
{
#ifdef Q_OS_SYMBIAN
    int lang=User::Language();
#else
    int lang=16;
#endif
    loc=new Localizer(lang,this);
    timer=new QTimer();
    timer->setSingleShot(false);
    timer->setInterval(60*1000);
    connect(timer,SIGNAL(timeout()),this,SLOT(Tick()));
    }

void Application::Tick()
{
    counts--;
    emit updateUi(counts/60,counts%60);
    if (counts<=0)
    {
#ifdef Q_OS_SYMBIAN
    TApaTaskList lst(CEikonEnv::Static()->WsSession());
    TApaTask mPlayer=lst.FindApp(TUid::Uid(0x102072c3));
    TApaTask rPlayer=lst.FindApp(TUid::Uid(0x10207a89));
    TApaTask intPlayer=lst.FindApp(TUid::Uid(0x2002ffc8));
    if (mPlayer.Exists()&&iPlayer){mPlayer.EndTask();}
    if (rPlayer.Exists()&&iRadio){rPlayer.EndTask();}
    if (intPlayer.Exists()&&iInternet){intPlayer.EndTask();}
#endif
    QApplication::exit(0);
    }
}

void Application::Stop()
{
timer->stop();
}

void Application::Start(int hours, int mins, bool player, bool radio, bool internet)
{
counts=hours*60+mins;
iInternet=internet;
iRadio=radio;
iPlayer=player;
if (counts!=0) timer->start();
}
void Application::Hide()
{
#ifdef Q_OS_SYMBIAN
// hide from task bar and go background
    CAknAppUi* appUi= ((CAknAppUi*)CEikonEnv::Static()->AppUi());
    appUi->HideApplicationFromFSW(ETrue);
    appUi->HideInBackground();
    CEikonEnv::Static()->SetSystem(ETrue);
    CCoeEnv *env = CCoeEnv::Static();
    TInt wgId = env->RootWin().Identifier();
    RWsSession session = env->WsSession();
    CApaWindowGroupName *wgName = CApaWindowGroupName::NewL(session, wgId);
    wgName->SetHidden(ETrue);
    wgName->SetWindowGroupName(env->RootWin());
    CEikonEnv::Static()->iWgName=wgName;
#else
    QApplication::exit(0);
#endif
}
