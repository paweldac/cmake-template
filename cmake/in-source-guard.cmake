include_guard()

include(colorful-message)

function(in_source_build_guard)
    if (${CMAKE_BINARY_DIR} STREQUAL ${CMAKE_CURRENT_SOURCE_DIR})
        cmessage(FATAL_ERROR "Building in-source is not supported! Please use out-of-source build dir and remove ${CMAKE_CURRENT_SOURCE_DIR}/CMakeFiles/ directory and ${CMAKE_CURRENT_SOURCE_DIR}/CMakeCache.txt")
    endif()
endfunction()
