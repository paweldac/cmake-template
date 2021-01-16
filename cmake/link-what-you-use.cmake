include_guard()

include(colorful-message)

option(ENABLE_LINK_WHAT_YOU_USE "Adds `-Wl,--no-as-needed` to targets linker flags" ON)

if(ENABLE_LINK_WHAT_YOU_USE)
  execute_process(
    COMMAND ${CMAKE_CXX_COMPILER} -Wl,--no-as-needed
    ERROR_STRIP_TRAILING_WHITESPACE
    ERROR_VARIABLE LINKER_ERRORS
    OUTPUT_QUIET)

  if(${LINKER_ERRORS} MATCHES "unknown option: --no-as-needed")
    cmessage(NOTICE
             "ENABLE_LINK_WHAT_YOU_USE cannot be enabled. Linker doesn't support `--no-as-needed`")
    set(ENABLE_LINK_WHAT_YOU_USE OFF)
  endif()
endif()

set(CMAKE_LINK_WHAT_YOU_USE ${ENABLE_LINK_WHAT_YOU_USE})
cmessage(STATUS "ENABLE_LINK_WHAT_YOU_USE is set to: ${CMAKE_LINK_WHAT_YOU_USE}")
