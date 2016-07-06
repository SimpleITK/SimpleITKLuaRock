cmake_minimum_required(VERSION 3.0)

set(proj SimpleITK)

set( ENV{MAKEFLAGS} "-j80" )

include(ExternalProject)


  set(SimpleITK_REPOSITORY http://itk.org/SimpleITK.git )
  #  set(SimpleITK_GIT_TAG be2a0912031121d0de50e7bfc2ac32aed8169809) # 0.10.0.dev199

  set(EP_SOURCE_DIR ${CMAKE_BINARY_DIR}/${proj})
  set(EP_BINARY_DIR ${CMAKE_BINARY_DIR}/${proj}-build)
  set(EP_INSTALL_DIR ${CMAKE_BINARY_DIR}/${proj}-install)


  # A separate project is used to download, so that the SuperBuild
  # subdirectory can be use for SimpleITK's SuperBuild to build
  # required Lua, GTest etc. dependencies not in Slicer SuperBuild
  ExternalProject_add(SimpleITK-download
    SOURCE_DIR ${EP_SOURCE_DIR}
    GIT_REPOSITORY ${SimpleITK_REPOSITORY}
    GIT_TAG ${SimpleITK_GIT_TAG}
    CONFIGURE_COMMAND ""
    INSTALL_COMMAND ""
    BUILD_COMMAND ""
    )

  ExternalProject_add(SimpleITK
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
    #
    #INSTALL_COMMAND ${CMAKE_COMMAND} -P ${_install_script}
    INSTALL_COMMAND ""
    #
    DEPENDS SimpleITK-download ${${proj}_DEPENDENCIES}
    )
  set(SimpleITK_DIR ${CMAKE_BINARY_DIR}/SimpleITK-build/SimpleITK-build)

  set(_lib_subdir lib)
  if(WIN32)
    set(_lib_subdir bin)
  endif()
