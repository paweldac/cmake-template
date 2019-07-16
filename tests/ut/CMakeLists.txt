include_guard()

add_test_executable(${PROJECT_NAME}.ut
    SOURCES
        ut.cpp
     DEPENDS
        GTest::gtest
        GTest::gtest_main
        GTest::gmock
)
