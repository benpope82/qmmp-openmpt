QT      += widgets
HEADERS += decoderfactory.h decoder.h metadatamodel.h settingsdialog.h settings.h mptwrap.h
SOURCES += decoder.cpp decoderfactory.cpp metadatamodel.cpp settingsdialog.cpp mptwrap.cpp
FORMS   += settingsdialog.ui

CONFIG += warn_on plugin link_pkgconfig c++11

TEMPLATE = lib

QMAKE_CLEAN += lib$${TARGET}.so

unix {
  CONFIG += link_pkgconfig
  PKGCONFIG += qmmp libopenmpt

  QMMP_PREFIX = $$system(pkg-config qmmp --var=prefix)
  INCLUDEPATH += $${QMMP_PREFIX}/include

  plugin.path = $${QMMP_PREFIX}/lib/qmmp/Input
  plugin.files = lib$${TARGET}.so
  INSTALLS += plugin
}
