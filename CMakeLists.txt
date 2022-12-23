CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

IF(${CMAKE_CURRENT_SOURCE_DIR} STREQUAL ${CMAKE_CURRENT_BINARY_DIR})
	# Protip: run cmake like this: cmake -Bbuild -H. or see the readme
	message(FATAL_ERROR "Prevented in-tree build.")
endif()

PROJECT(love-imgui)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

set(CMAKE_VERBOSE_MAKEFILE ON)

SET(LUAJIT_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/src/luajit")
SET(LUAJIT_LIBRARY "${CMAKE_SOURCE_DIR}/src/luajit")

FIND_PACKAGE(LuaJIT)
IF(NOT LUAJIT_FOUND)
	FIND_PACKAGE(Lua 5.1 EXACT REQUIRED)
	SET(DESIRED_LUA_INCLUDE_DIR ${LUA_INCLUDE_DIR})
	SET(DESIRED_LUA_LIBRARY ${LUA_LIBRARIES})
ELSE()
	SET(DESIRED_LUA_INCLUDE_DIR ${LUAJIT_INCLUDE_DIR})
	SET(DESIRED_LUA_LIBRARY ${LUAJIT_LIBRARY})
ENDIF()

ADD_LIBRARY(love-imgui
	MODULE
	src/libimgui/imconfig.h
	src/libimgui/imgui.cpp
	src/libimgui/imgui.h
	src/libimgui/imgui_draw.cpp
	src/libimgui/imgui_demo.cpp
	src/libimgui/imgui_widgets.cpp
	src/libimgui/imgui_internal.h
	src/libimgui/stb_rect_pack.h
	src/libimgui/stb_textedit.h
	src/libimgui/stb_truetype.h
	src/imgui_impl.cpp
	src/wrap_imgui_impl.cpp
	src/imgui_impl.h
	src/wrap_imgui_impl.h
	src/imgui_iterator.h
	src/dostring_cache.cpp
)

TARGET_INCLUDE_DIRECTORIES(love-imgui PUBLIC
	${DESIRED_LUA_INCLUDE_DIR}
)

IF(WIN32 OR ANDROID OR IOS)
	TARGET_LINK_LIBRARIES(love-imgui ${DESIRED_LUA_LIBRARY})
ELSEIF(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
	TARGET_COMPILE_DEFINITIONS(love-imgui -undefined dynamic_lookup)
ENDIF()

SET_TARGET_PROPERTIES(love-imgui PROPERTIES PREFIX "" OUTPUT_NAME "imgui")

INSTALL(TARGETS love-imgui LIBRARY DESTINATION .)
