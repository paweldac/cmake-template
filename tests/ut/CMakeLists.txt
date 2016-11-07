set(UT_BIN ${PROJECT_NAME}.ut)

include_directories(
    ${GMOCK_INCLUDE_DIRS}
    ${GTEST_INCLUDE_DIRS}
)

link_directories(
    ${GMOCK_LIBDIR}
    ${GTEST_LIBDIR}
)

add_executable(
    ${UT_BIN}
    ut.cpp
)

target_link_libraries(
    ${UT_BIN}
    ${GMOCK_LIBRARIES}
    ${GTEST_LIBRARIES}
    ${CMAKE_THREAD_LIBS_INIT}
)

add_dependencies(${UT_BIN} googlemock googletest)
