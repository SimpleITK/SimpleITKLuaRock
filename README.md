# SimpleITKLuaRock

This package is an initial attempt to create a rockspec file that will build and install a SimpleITK module for Lua via LuaRocks (https://luarocks.org), a package manager for Lua modules.

Building the module requires Lua v5.1.5, LuaRocks v2.3 and CMake v3.  Because SimpleITK is built as a CMake-type build in LuaRocks, this module will only build on Linux and OS X.  Currently cmake builds are not supported on Windows in Luarocks.

Building SimpleITK requires a lot of compute power.  We recommend a multi-core system with a sizable amount of memory.  Also, to facilitate multi-processing, the environment variable MAKEFLAGS should be set to something like "-jN", where N is the number of cores.  For example, on an 8 core system, use the following:
```
  export MAKEFLAGS="-j8"
```  
Building the SimpleITK Lua module with the following command:
```
  luarocks install simpleitk-0.10-0.rockspec
```
Written by David T. Chen from the National Library of Medicine, dchen@mail.nih.gov. It is covered by the Apache License, Version 2.0:

http://www.apache.org/licenses/LICENSE-2.0

SimpleITK is a simplified layer on top of the Insight Segmentation and Registration Toolkit (ITK).  

Be warned that building SimpleITK requires a fairly powerful, multicore machine.  This SimpleITK rockspec uses luarock's "cmake" build type.  Therefore it will only build on Linux or Mac OS X systems.

For more information about SimpleITK, visit http://simpleitk.org

For more information about ITK, visit http://itk.org
