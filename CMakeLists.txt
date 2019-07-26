project(cmake-template)

cmake_minimum_required(VERSION 3.10)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/clang/compilation-flags.cmake)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/common/build-dirs.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/common/build-types.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/common/clang-format.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/common/cpp-standard.cmake)

find_package(Threads REQUIRED)
find_package(Boost 1.66.0 COMPONENTS system REQUIRED)
if(Boost_FOUND)
    message("BOOST_ROOT: ${BOOST_ROOT}")
    message("BOOSTROOT: ${BOOSTROOT}")
    message("Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
endif()

include(CTest)
if(BUILD_TESTING)
    enable_testing()
    find_package(GTest CONFIG REQUIRED)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/testing.cmake)
    setup_tests_meta_target(${PROJECT_NAME}.tests)
    add_subdirectory(tests)
endif()

add_subdirectory(src)
