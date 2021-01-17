include_guard()

include(colorful-message)

option(ENABLE_INCLUDE_WHAT_YOU_USE "Enables include-what-you-use source code check" OFF)

if(${ENABLE_INCLUDE_WHAT_YOU_USE})
  find_program(INCLUDE_WHAT_YOU_USE_BIN NAMES include-what-you-use iwyu REQUIRED)
  set(INCLUDE_WHAT_YOU_USE_IMP ${CMAKE_SOURCE_DIR}/config/iwyu-mappings.imp)
  set(INCLUDE_WHAT_YOU_USE_CMD ${INCLUDE_WHAT_YOU_USE_BIN} -Xiwyu
                               --mapping_file=${INCLUDE_WHAT_YOU_USE_IMP})

  if(CMAKE_CXX_STANDARD EQUAL "17")
    set(INCLUDE_WHAT_YOU_USE_CMD ${INCLUDE_WHAT_YOU_USE_CMD} -Xiwyu --cxx17ns)
  endif()

  set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE ${INCLUDE_WHAT_YOU_USE_CMD})
  set(CMAKE_C_INCLUDE_WHAT_YOU_USE ${INCLUDE_WHAT_YOU_USE_CMD})

  cmessage(STATUS "Build with enabled include-what-you-use(${INCLUDE_WHAT_YOU_USE_BIN}) checks")
endif()
