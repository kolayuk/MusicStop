# Add more folders to ship with the application, here
folder_01.source = qml/MusicStop
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =
qt_components.pkg_prerules += "(0x200346DE), 1, 1, 0, {\"Qt Components\"}"
symbian:DEPLOYMENT += qt_components
symbian:DEPLOYMENT.installer_header = "$${LITERAL_HASH}{\"MusicStop\"},(0x2002CCCF),1,1,0"
packageheader = "$${LITERAL_HASH}{\"MusicStop\"}, (0x2005FC7E), 1, 1, 0, TYPE=SA"
info.pkg_prerules=packageheader
symbian:DEPLOYMENT+=info

vendorinfo =  "%{\"Alexander Fokin\"}" \
    ":\"Alexander Fokin\""
vendor.pkg_prerules = vendorinfo
symbian:DEPLOYMENT += vendor

symbian:TARGET.UID3 = 0x2005FC7E
symbian:TARGET.CAPABILITY += NetworkServices PowerMgmt

locs.source=D:\Symbian\QtSDK\workspace\MusicStop\lang
locs.target =
symbian:DEPLOYMENTFOLDERS+=locs

CONFIG += qt-components
SOURCES += main.cpp \
           localizer.cpp \
           application.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

symbian:LIBS+=-lapgrfx
symbian:LIBS+=-leikcore
symbian:LIBS+=-lavkon
symbian:LIBS+=-leiksrv
symbian:LIBS+=-lcone
symbian:LIBS+=-lapparc
symbian:LIBS+=-lws32

OTHER_FILES +=

HEADERS += localizer.h
HEADERS += application.h





