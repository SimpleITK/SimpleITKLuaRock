#!/usr/bin/env lua

package = 'simpleitk'
version = '1.0-0'
source  = {
    url    = 'git://github.com/dave3d/lua-simpleitk.git',
    branch = 'v1.0-0',
}
description = {
    summary  = "A Lua binding to SimpleITK.",
    detailed = '',
    homepage = 'http://github.com/SimpleITK/SimpleITK',
    license  = 'BSD',
}
dependencies = {
    'lua >= 5.1'
}
build    = {
    type = 'cmake',
    variables = {
        INSTALL_CMOD      = "$(LIBDIR)",
        CMAKE_BUILD_TYPE  = "$(CMAKE_BUILD_TYPE)",
        ["CFLAGS:STRING"] = "$(CFLAGS)",
    },
}
