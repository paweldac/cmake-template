include_guard()

include(colorful-message)

set(CPP_98_STR "98")
set(CPP_11_STR "11")
set(CPP_14_STR "14")
set(CPP_17_STR "17")
set(CPP_20_STR "20")

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(DEFAULT_CPP_STANDARD ${CPP_17_STR})

if (NOT CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD "${CPP_17_STR}" CACHE STRING
        "C++ standard, choose from ${CPP_98_STR}, ${CPP_11_STR}, ${CPP_14_STR}, ${CPP_17_STR} and ${CPP_20_STR}" FORCE)
    set_property(CACHE CMAKE_CXX_STANDARD PROPERTY STRINGS
        ${CPP_98_STR} ${CPP_11_STR} ${CPP_14_STR} ${CPP_17_STR} ${CPP_20_STR})
endif()

cmessage(STATUS "C++ standard is set to: ${CMAKE_CXX_STANDARD}")
