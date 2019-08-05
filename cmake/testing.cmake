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

#Add Dependency between `TARGET_TO_ATTACH` and META_TARGETS _builds
function(attach_targets_to_meta_target)
    set(options)
    set(oneValueArgs TARGET_TO_ATTACH)
    set(multiValueArgs META_TARGETS)
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    foreach(META_TARGET ${ARGS_META_TARGETS})
        add_dependencies(${META_TARGET}_build ${ARGS_TARGET_TO_ATTACH})
    endforeach()
endfunction()

#SUT allows to access private headers of system under test target
#SOURCES are *.cpp fiels with tests
#DEPENDS allows to create private dependnecy to test target eg. gtest
#META_TARGETS allows to add `TEST_TARGET` as depenency to meta tagets
function(add_test_executable TEST_TARGET)
    set(options)
    set(oneValueArgs SUT)
    set(multiValueArgs SOURCES DEPENDS META_TARGETS)
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    if(NOT ARGS_SOURCES)
        message(FATAL_ERROR "Target: ${TEST_TARGET} lacks sources.")
    endif()
    add_executable(${TEST_TARGET} "${ARGS_SOURCES}")
    target_link_libraries(${TEST_TARGET} PRIVATE "${ARGS_SUT}" "${ARGS_DEPENDS}")
    if(ARGS_SUT)
        target_include_directories(${TEST_TARGET} PRIVATE $<TARGET_PROPERTY:${ARGS_SUT},INCLUDE_DIRECTORIES>)
    endif()
    gtest_discover_tests(${TEST_TARGET} PROPERTIES LABELS "${ARGS_META_TARGETS}")
    attach_targets_to_meta_target(TARGET_TO_ATTACH ${TEST_TARGET} META_TARGETS ${ARGS_META_TARGETS})
endfunction()

#MOCKS defines library, which will be mocked by `MOCKS_TARGET_NAME`
#DIR directory where mock files are stored
#META_TARGETS allows to add `MOCKS_TARGET_NAME` as depenency to meta tagets
function(add_mocks_target MOCKS_TARGET_NAME)
    set(options)
    set(oneValueArgs MOCKS DIR)
    set(multiValueArgs META_TARGETS)
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    if(NOT ARGS_MOCKS)
        message(FATAL_ERROR "Target: ${MOCKS_TARGET_NAME} lacks target to mock.")
    endif()
    if(NOT ARGS_DIR)
        message(FATAL_ERROR "Target: ${MOCKS_TARGET_NAME} lacks directory with mocks.")
    endif()
    add_library(${MOCKS_TARGET_NAME} INTERFACE)
    target_include_directories(${MOCKS_TARGET_NAME} INTERFACE ${ARGS_DIR})
    target_link_libraries(${MOCKS_TARGET_NAME}
          INTERFACE
            ${ARGS_MOCKS}
            GTest::gmock
    )
    attach_targets_to_meta_target(TARGET_TO_ATTACH ${MOCKS_TARGET_NAME} META_TARGETS ${ARGS_META_TARGETS})
endfunction()
