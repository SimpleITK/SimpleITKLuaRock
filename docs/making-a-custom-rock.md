
Making a custom rock
====================

Each release of the SimpleITK Luarock is tied to a specific release of
SimpleITK.  For example the 1.2 SimpleITK Luarock downloads v1.2 of
SimpleITK from GitHub.

If you would prefer to build a different version of SimpleITK, you need
a custom version of the rockspec file.  Here is what such a rockspec
file would look like.

    #!/usr/bin/env lua

    package = 'SimpleITK'
    version = 'x.0-0'
    source  = {
        url    = 'file://SimpleITKLuarock.tgz',
        dir = 'SimpleITKLuarock',
    }
    description = {
        summary  = "A Lua binding to SimpleITK.",
        detailed = '',
        homepage = 'https://github.com/SimpleITK/SimpleITKLuaRock',
        license  = 'BSD',
    }
    dependencies = {
        'lua >= 5.1'
    }
    build    = {
        type = 'cmake',
        modules = {
            SimpleITK = "SimpleITK-build/Wrapping/Lua/lib/SimpleITK.so",
        },
        variables = {
            INSTALL_CMOD      = "$(LIBDIR)",
            CMAKE_BUILD_TYPE  = "$(CMAKE_BUILD_TYPE)",
            ["CFLAGS:STRING"] = "$(CFLAGS)",
        },
        copy_directories = { "doc", "examples" }
    }

The main difference between this rockspec and the standard version is the
**source** section.  In this rockspec the source points to a local tar
file.

Also, this rockspec does not have the SimpleITK_VERSION variable
in the build/variables section that the v1.2 rockspec does.  So the v1.2
rockspec tells CMake to use SimpleITK version 1.2.  Because this custom
rockspec does not have the SimpleITK_VERSION set, cmake will use the
latest version from GitHub's master branch of SimpleITK.

If you wanted to test build a newer version of the SimpleITK Lua rock,
just create a custom rockspec with SimpleITK_VERSION set to the newer
version.

