# SimpleITKLuaRock
![CircleCI Status](https://circleci.com/gh/SimpleITK/SimpleITKLuaRock.svg?&style=shield&circle-token)

This package is an initial attempt to create a rockspec file that will build and install a SimpleITK module for Lua via [LuaRocks](https://luarocks.org), a package manager for Lua modules.  [SimpleITK](http://www.simpleitk.org) is a simplified programming layer on top of the [Insight Segmentation and Registration Toolkit](https://itk.org) (ITK).  ITK is an open-source, cross-platform system that provides developers with an extensive suite of software tools for image analysis.

## Building the SimpleITK Lua module
Building the module requires Lua v5.1.5, LuaRocks v2.2 and [CMake](https://cmake.org) v3.  Because SimpleITK is built as a CMake-type build in LuaRocks, this module will only build on Linux and OS X.  Currently cmake builds are not supported on Windows in Luarocks.

Building SimpleITK requires a sizeable amount of computing power.  We recommend a multi-core system with a sizable amount of memory.  Also, to facilitate multi-processing, the environment variable MAKEFLAGS should be set to something like "-jN", where N is the number of cores.  For example, on an 8 core system, use the following:
```
  export MAKEFLAGS="-j8"
```  
Build the SimpleITK Lua module with the following command:
```
  luarocks install simpleitk-0.10-0.rockspec
```
## SimpleDerivative.lua example
When building the module, an example progam is installed into the SimpleITK rock, [SimpleDerivative.lua](https://github.com/SimpleITK/SimpleITK/blob/master/Examples/Lua/SimpleDerivative.lua).  It is copied from the [SimpleITK repository](https://github.com/SimpleITK/SimpleITK) .

The program demonstrates a basic progam that uses SimpleITK to create an image of a Gaussian, and then performs some operations on that image.  First it applies the first derivative in the X direction on the gaussian, then it rescales the pixel intensities and converts the pixel types from float32 to uint8.  Finally the result is written out as a PNG file, and the image is displayed with the [Show function](https://itk.org/SimpleITKDoxygen/html/namespaceitk_1_1simple.html#ac8416e6e7f02dedfe8373b83dbea411d), which invokes [Fiji/ImageJ](http://fiji.sc).
## Miscellaneous
Written by [David T. Chen](https://lhncbc.nlm.nih.gov/personnel/david-chen) from the [National Library of Medicine](https://www.nlm.nih.gov), dchen@mail.nih.gov. It is covered by the Apache License, Version 2.0:

http://www.apache.org/licenses/LICENSE-2.0

For more information about SimpleITK, visit http://simpleitk.org

For more information about ITK, visit http://itk.org
