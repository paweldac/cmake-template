include(ExternalProject)

ExternalProject_Add(
    googletest
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/tools/googletest/googletest
    INSTALL_COMMAND ""
)
ExternalProject_Get_Property(googletest source_dir)
set(GTEST_INCLUDE_DIRS ${source_dir}/include)
ExternalProject_Get_Property(googletest binary_dir)
set(GTEST_LIBDIR ${binary_dir})
set(GTEST_LIBRARIES gtest gtest_main)

ExternalProject_Add(
    googlemock
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/tools/googletest/googlemock
    INSTALL_COMMAND ""
)
ExternalProject_Get_Property(googlemock source_dir)
set(GMOCK_INCLUDE_DIRS ${source_dir}/include)
ExternalProject_Get_Property(googlemock binary_dir)
set(GMOCK_LIBDIR ${binary_dir})
set(GMOCK_LIBRARIES gmock gmock_main)

add_subdirectory(ut)
