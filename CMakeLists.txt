project(cmake-template)

cmake_minimum_required(VERSION 3.17)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(compilation-flags)
include(build-dirs)
include(build-types)
include(clang-format)
include(cpp-standard)

find_package(Threads REQUIRED)
find_package(Boost 1.70.0 COMPONENTS system REQUIRED)
if(Boost_FOUND)
    message("BOOST_ROOT: ${BOOST_ROOT}")
    message("BOOSTROOT: ${BOOSTROOT}")
    message("Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
endif()

include(CTest)
if(BUILD_TESTING)
    enable_testing()
    find_package(GTest CONFIG REQUIRED)
    include(testing)
    setup_tests_meta_target(${PROJECT_NAME}.tests)
    add_subdirectory(tests)
endif()

add_subdirectory(src)
