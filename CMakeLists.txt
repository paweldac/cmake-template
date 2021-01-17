cmake_minimum_required(VERSION 3.18)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(policies)

project(cmake-template)

include(compilation-flags)
include(colorful-message)
include(in-source-guard)
include(build-dirs)
include(build-types)
include(clang-format)
include(cpp-standard)
include(find-alternative-linkers)
include(memory-sanitizers)
include(export-compile-commands_json)
include(include-what-you-use)

in_source_build_guard()

find_package(Threads REQUIRED)
find_package(Boost 1.70.0 COMPONENTS system REQUIRED)
if(Boost_FOUND)
  cmessage(STATUS "BOOST_ROOT: ${BOOST_ROOT}")
  cmessage(STATUS "Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
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
