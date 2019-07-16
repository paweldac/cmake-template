include_guard()

find_package(GTest CONFIG REQUIRED)
include(GoogleTest)

function(add_test_executable TEST_NAME)
    set(options)
    set(oneValueArgs)
    set(multiValueArgs SOURCES DEPENDS)
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    add_executable(${TEST_NAME} "${ARGS_SOURCES}")
    target_link_libraries(${TEST_NAME} PRIVATE "${ARGS_DEPENDS}")
    gtest_discover_tests(${TEST_NAME})
endfunction()

add_subdirectory(ut)
