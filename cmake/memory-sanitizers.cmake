include_guard()

include(colorful-message)

set(VALGRIND "Valgrind")

if (NOT MEMORY_SANITIZER)
    set(MEMORY_SANITIZER "None" CACHE STRING
        "Memory sanitizer for build, choose from ${VALGRIND} and None" FORCE)
    set_property(CACHE MEMORY_SANITIZER PROPERTY STRINGS
        ${VALGRIND} "None")
endif()

if (${MEMORY_SANITIZER} MATCHES ${VALGRIND})
    find_program(MEMORYCHECK_COMMAND valgrind REQUIRED)
    set(MEMORYCHECK_TYPE Valgrind)
    set(MEMORYCHECK_COMMAND_OPTIONS "--leak-check=full --show-leak-kinds=all --track-origins=yes --trace-children=yes --verbose --error-exitcode=1")
endif()

if (NOT ${MEMORY_SANITIZER} MATCHES "None")
    cmessage(STATUS "Build with enabled sanitizer: ${MEMORY_SANITIZER}")
else()
    cmessage(STATUS "Sanitizers are disabled in build")
endif()
