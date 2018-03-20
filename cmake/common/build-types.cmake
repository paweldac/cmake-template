##### pragma once #####
if(BUILD_TYPES_INCLUDED)
    return()
endif()
set(BUILD_TYPES_INCLUDED true)
#######################

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE "Debug" CACHE STRING
        "Choose build type." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
    "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)

message(STATUS "Build type is set to: ${CMAKE_BUILD_TYPE}")
