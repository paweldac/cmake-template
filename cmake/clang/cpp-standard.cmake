##### pragma once #####
if(CLANG_CPP_STANDARD_INCLUDED)
    return()
endif()
set(CLANG_CPP_STANDARD_INCLUDED true)
#######################

set(CPP_STANDARD "C++11" CACHE STRING "C++ standard, choose from C++03, C++11, C++14 and C++17")

if(CPP_STANDARD STREQUAL "C++03")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++03")
elseif(CPP_STANDARD STREQUAL "C++11")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(CPP_STANDARD STREQUAL "C++14")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
elseif(CPP_STANDARD STREQUAL "C++17")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1z")
else()
    message(FATAL_ERROR "Wrong C++ Standard. Choose from C++03, C++11, C++14 and C++17")
endif()

message(STATUS "C++ standard is ${CPP_STANDARD}")
