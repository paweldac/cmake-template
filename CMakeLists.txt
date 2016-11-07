project(cmake-template)

cmake_minimum_required(VERSION 3.2)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/clang/cpp-standard.cmake)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/clang/build-types.cmake)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/common/build-dirs.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/common/clang-format.cmake)

find_package(Threads REQUIRED)

add_subdirectory(src)
add_subdirectory(tests)
