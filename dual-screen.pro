QT += gui qml

SOURCES += \
    main.cpp

OTHER_FILES = \
    qml/main.qml \

RESOURCES += dual-screen.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/wayland/dual-screen
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS dual-screen.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/wayland/dual-screen
INSTALLS += target sources

DISTFILES += \
    qml/Screen.qml \
    qml/Chrome.qml
