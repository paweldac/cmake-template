##### pragma once #####
if(CLANG_BUILD_TYPES_INCLUDED)
    return()
endif()
set(CLANG_BUILD_TYPES_INCLUDED true)
#######################

set(BUILD_TYPE "Debug" CACHE STRING "Build type, choose from Debug. Release and MinRelease")

if(BUILD_TYPE STREQUAL "Debug")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb -g -gdwarf-2")
elseif(BUILD_TYPE STREQUAL "Release")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
elseif(BUILD_TYPE STREQUAL "MinRelease")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Os -fdata-sections -ffunction-sections")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections")
else()
    message(FATAL_ERROR "Wrong BUILD_TYPE. Should be Debug, Release or MinRelease.")
endif()

message(STATUS "Build type is ${BUILD_TYPE}")
