include_guard()

include(colorful-message)

if(NOT CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_EXPORT_COMPILE_COMMANDS
      ON
      CACHE BOOL "Enable output of compile commands during generation." FORCE)
endif()

cmessage(STATUS "Export of compile commands is set to: ${CMAKE_EXPORT_COMPILE_COMMANDS}")
