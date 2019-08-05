include_guard()

add_subdirectory(mocks)

add_test_executable(${PROJECT_NAME}.ut
    SUT
        cmake-template.app_lib
    SOURCES
        ut.cpp
        PrimesAccumulatorTests.cpp
     DEPENDS
        PrimesCalculatorMocks
        GTest::gtest
        GTest::gtest_main
        GTest::gmock
     META_TARGETS
        ${PROJECT_NAME}.tests
)
