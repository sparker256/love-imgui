# Shared library without any Qt functionality
TEMPLATE = lib
QT -= gui core

CONFIG += warn_on plugin release
CONFIG -= thread exceptions qt rtti debug

VERSION = 1.0.0

I
INCLUDEPATH += ../src \
               ../src/luajit \
               .../src/libimgui


INCLUDEPATH += ..
VPATH = ..


unix:!macx {
    DEFINES += APL=0 IBM=0 LIN=1 LINUX=1
    TARGET = lin.xpl
    # WARNING! This requires the latest version of the X-SDK !!!!
    QMAKE_CXXFLAGS += -fvisibility=hidden -O2 -Wall -Wextra -Wshadow -Wfloat-equal -Wformat -Wformat-security \
         --param ssp-buffer-size=4 -fstack-protector -D_FORTIFY_SOURCE=2 -std=gnu++11 -fpermissive
    QMAKE_CFLAGS += -fvisibility=hidden -O2 -Wall -Wextra -Wshadow -Wfloat-equal -Wformat -Wformat-security \
         --param ssp-buffer-size=4 -fstack-protector -D_FORTIFY_SOURCE=2
    LIBS += -ldl -Wl,--version-script -Wl,../src/exports.txt
    LIBS += -static-libgcc -static-libstdc++ -fPIC
}


HEADERS +=  ../src/dostring_cache.h \
            ../src/imgui_impl.h \
            ../src/imgui_iterator.h \
            ../src/wrap_imgui_impl.h \
            ../src/libimgui/imconfig.h \
            ../src/libimgui/imgui.h \
            ../src/libimgui/imgui_internal.h \
            ../src/libimgui/imstb_rectpack.h \
            ../src/libimgui/imstb_textedit.h \
            ../src/libimgui/imstb_truetype.h \
            ../src/libimgui/stb_rect_pack.h \
            ../src/libimgui/stb_textedit.h \
            ../src/libimgui/stb_truetype.h \
            ../src/luajit/lauxlib.h \
            ../src/luajit/lua.h \
            ../src/luajit/luaconf.h \
            ../src/luajit/luajit.h \
            ../src/luajit/lualib.h \
            

SOURCES +=  ../src/dostring_cache.cpp \
            ../src/imgui_impl.cpp \
            ../src/wrap_imgui_impl.cpp \
            ../src/libimgui/imgui.cpp \
            ../src/libimgui/imgui_demo.cpp \
            ../src/libimgui/imgui_draw.cpp \
            ../src/libimgui/imgui_widgets.cpp \

