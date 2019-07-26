include_guard()

include(GoogleTest)

#https://stackoverflow.com/questions/733475/cmake-ctest-make-test-doesnt-build-tests
function(setup_tests_meta_target META_TARGET)
    add_custom_target(${META_TARGET}_build)
    add_custom_target(
            ${META_TARGET}
            COMMAND ${CMAKE_CTEST_COMMAND} . --schedule-random --output-on-failure --label-regex ${META_TARGET}
            DEPENDS ${META_TARGET}_build
            COMMENT "Build and run tests in ${META_TARGET} meta target"
            VERBATIM
    )
endfunction()

#SUT allows to access private headers of system under test target
#SOURCES are *.cpp fiels with tests
#DEPENDS allows to create private dependnecy to test target eg. gtest
#META_TARGETS allows to add TEST_TARGET to passed tests meta tagets
function(add_test_executable TEST_TARGET)
    set(options)
    set(oneValueArgs SUT)
    set(multiValueArgs SOURCES DEPENDS META_TARGETS)
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    add_executable(${TEST_TARGET} "${ARGS_SOURCES}")
    target_link_libraries(${TEST_TARGET} PRIVATE "${ARGS_SUT}" "${ARGS_DEPENDS}")
    #Allows to access private includes
    if(ARGS_SUT)
        target_include_directories(${TEST_TARGET} PRIVATE $<TARGET_PROPERTY:${ARGS_SUT},INCLUDE_DIRECTORIES>)
    endif()
    gtest_discover_tests(${TEST_TARGET} PROPERTIES LABELS "${ARGS_META_TARGETS}")
    #Dependency to all META_TARGET _builds
    foreach(META_TARGET ${ARGS_META_TARGETS})
        add_dependencies(${META_TARGET}_build ${TEST_TARGET})
    endforeach()
endfunction()
