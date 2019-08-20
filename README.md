# SimpleITKLuaRock
[![CircleCI Status](https://circleci.com/gh/SimpleITK/SimpleITKLuaRock.svg?&style=shield&circle-token)](https://circleci.com/gh/SimpleITK/SimpleITKLuaRock)

This package is a rockspec file that will build and install a SimpleITK module for Lua via [LuaRocks](https://luarocks.org), a package manager for Lua modules.  [SimpleITK](http://www.simpleitk.org) is a simplified, open source interface to the [Insight Segmentation and Registration Toolkit](https://itk.org) (ITK).  ITK is an open-source, cross-platform toolkit that provides developers with an extensive suite of software tools for image analysis and is widely used in academia and industry.

## Building the SimpleITK Lua module
Building the module requires Lua v5.1.5, LuaRocks v2.2 and [CMake](https://cmake.org) v3.10.  Because SimpleITK is built as a CMake-type build in LuaRocks, this module will only build on Linux and OS X.  Currently cmake builds are not supported on Windows in Luarocks.

Building SimpleITK requires a sizeable amount of computing power.  We recommend a multi-core system with a sizable amount of memory.  Also, to facilitate multi-processing, the environment variable MAKEFLAGS should be set to something like "-jN", where N is the number of cores.  For example, on an 8 core system, use the following:
```
  export MAKEFLAGS="-j8"
```
Build the SimpleITK Lua module with the following command:
```
  luarocks install simpleitk-1.2.2-0.rockspec
```
## SimpleDerivative.lua example
When building the module, an example progam is installed into the SimpleITK rock, [SimpleDerivative.lua](https://github.com/SimpleITK/SimpleITK/blob/master/Examples/Lua/SimpleDerivative.lua).  It is copied from the [SimpleITK repository](https://github.com/SimpleITK/SimpleITK) .

This example demonstrates a basic progam that uses SimpleITK to create an image of a Gaussian and then performs some operations on that image.  First it applies the first derivative in the X direction on the Gaussian, then it rescales the pixel intensities and converts the pixel types from float32 to uint8.  Finally the result is written out as a PNG file, and the image is displayed with the [Show function](https://itk.org/SimpleITKDoxygen/html/namespaceitk_1_1simple.html#ac8416e6e7f02dedfe8373b83dbea411d), which invokes [Fiji/ImageJ](http://fiji.sc).

## Custom builds
The rockspec in this package is tied to a particular version of SimpleITK.  So simpleitk-1.2-0.rockspec will build SimpleITK v1.2.
To build a custom version of SimpleITK consult the [Building a Custom Version of the SimpleITK Luarock](https://github.com/SimpleITK/SimpleITKLuaRock/wiki/Building-a-custom-version-of-a-SimpleITK-rock) page.

## Miscellaneous
Written by [David T. Chen](https://lhncbc.nlm.nih.gov/personnel/david-chen) from the [National Library of Medicine](https://www.nlm.nih.gov), dchen@mail.nih.gov. It is covered by the Apache License, Version 2.0:

http://www.apache.org/licenses/LICENSE-2.0

For more information about SimpleITK, visit http://simpleitk.org

For more information about ITK, visit http://itk.org
