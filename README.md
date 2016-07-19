# lua-simpleitk

An initial attempt to create a rockspec file that will build and install a SimpleITK module for Lua.

Written by David T. Chen from the National Library of Medicine, dchen@mail.nih.gov. It is covered by the Apache License, Version 2.0:

http://www.apache.org/licenses/LICENSE-2.0

SimpleITK is a simplified layer on top of the Insight Segmentation and Registration Toolkit (ITK).  

Be warned that building SimpleITK requires a fairly powerful, multicore machine.  This SimpleITK rockspec uses luarock's "cmake" build type.  Therefore it will only build on Linux or Mac OS X systems.

For more information about SimpleITK, visit http://simpleitk.org

For more information about ITK, visit http://itk.org
