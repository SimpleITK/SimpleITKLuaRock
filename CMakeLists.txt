
cmake_minimum_required(VERSION 3.3)

project(SimpleITKLuaRockspec)

set(proj SimpleITKSuperbuild)

# compile with multiple processors
include(ProcessorCount)
ProcessorCount(NPROC)
if (NOT NPROC EQUAL 0)
  set( ENV{MAKEFLAGS} "-j${NPROC}" )
endif()


set(LUA_SIMPLE_ITK_VERSION "0.10-0")

include(ExternalProject)


set( SimpleITK_REPOSITORY http://itk.org/SimpleITK.git )
set(SimpleITK_GIT_TAG v0.10.0)

set( EP_SOURCE_DIR ${CMAKE_BINARY_DIR}/${proj} )
set( EP_BINARY_DIR ${CMAKE_BINARY_DIR}/${proj}-build )
set( EP_INSTALL_DIR ${CMAKE_BINARY_DIR}/${proj}-install )


# A separate project is used to download SimpleITK, so that the SuperBuild
# subdirectory can be use for SimpleITK's SuperBuild to build the
# required Lua, GTest etc.
ExternalProject_add( ${proj}-download
  SOURCE_DIR ${EP_SOURCE_DIR}
  GIT_REPOSITORY ${SimpleITK_REPOSITORY}
  GIT_TAG ${SimpleITK_GIT_TAG}
  CONFIGURE_COMMAND ""
  INSTALL_COMMAND ""
  BUILD_COMMAND ""
  )


# The actual SimpleITK Superbuild project that build all the tools
# needed (GTest, PCRE, Swig, Lua & GTest) and then SimpleITK itself.
ExternalProject_add( ${proj}
  ${${proj}_EP_ARGS}
  SOURCE_DIR ${EP_SOURCE_DIR}/SuperBuild
  BINARY_DIR ${EP_BINARY_DIR}
  INSTALL_DIR ${EP_INSTALL_DIR}
  DOWNLOAD_COMMAND ""
  UPDATE_COMMAND ""
  CMAKE_CACHE_ARGS
    -DBUILD_EXAMPLES:BOOL=OFF
    -DBUILD_TESTING:BOOL=OFF
    -DBUILD_DOXYGEN:BOOL=OFF
    -DWRAP_PYTHON:BOOL=OFF
    -DWRAP_TCL:BOOL=OFF
    -DWRAP_JAVA:BOOL=OFF
    -DWRAP_RUBY:BOOL=OFF
    -DWRAP_LUA:BOOL=ON
    -DWRAP_CSHARP:BOOL=OFF
    -DWRAP_R:BOOL=OFF
    -DSimpleITK_BUILD_STRIP:BOOL=ON
    -DSimpleITK_BUILD_DISTRIBUTE:BOOL=ON
  INSTALL_COMMAND ""
  DEPENDS ${proj}-download ${${proj}_DEPENDENCIES}
  )

if ( DEFINED INSTALL_CMOD )
  set( INSTALL_DEST ${INSTALL_CMOD} )
else ()
  set( INSTALL_DEST ${CMAKE_INSTALL_PREFIX}/lib/luarocks/rocks/simpleitk/${LUA_SIMPLEITK_VERSION} )
endif ()

  
# install the SimpleITK shared library.
set( SITK_BUILD_DIR ${CMAKE_BINARY_DIR}/${proj}-build/SimpleITK-build )
install( FILES ${SITK_BUILD_DIR}/Wrapping/Lua/lib/SimpleITK.so
  DESTINATION ${INSTALL_DEST}
  )

set( SITK_SOURCE_DIR ${CMAKE_BINARY_DIR}/${proj} )

# copy the LICENCE, NOTICE and Readme.md from SimpleITK's source tree to this directory
install( FILES ${SITK_SOURCE_DIR}/LICENSE ${SITK_SOURCE_DIR}/NOTICE ${SITK_SOURCE_DIR}/Readme.md
  DESTINATION ${CMAKE_SOURCE_DIR}/doc
  )

# copy the SimpleDerivative.lua example file from SimpleITK into this directory
install( FILES ${SITK_SOURCE_DIR}/Examples/Lua/SimpleDerivative.lua
  DESTINATION ${CMAKE_SOURCE_DIR}
  )

    
set(_lib_subdir lib)
if(WIN32)
  set(_lib_subdir bin)
endif()
