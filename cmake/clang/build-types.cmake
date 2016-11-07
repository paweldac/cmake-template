##### pragma once #####
if(CLANG_BUILD_TYPES_INCLUDED)
    return()
endif()
set(CLANG_BUILD_TYPES_INCLUDED true)
#######################

set(BUILD_TYPE "DEBUG" CACHE STRING "Build type, choose from DEBUG. RELEASE and MIN_RELEASE")

if(BUILD_TYPE STREQUAL "DEBUG")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb -g -gdwarf-2")
elseif(BUILD_TYPE STREQUAL "RELEASE")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
elseif(BUILD_TYPE STREQUAL "MIN_RELEASE")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Os -fdata-sections -ffunction-sections")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections")
else()
    message(FATAL_ERROR "Wrong BUILD_TYPE. Should be DEBUG, RELEASE or MIN_RELEASE.")
endif()

message(STATUS "Build type is ${BUILD_TYPE}")
