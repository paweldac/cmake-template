include_guard()

include(colorful-message)
include(CMakeDependentOption)

option(ENABLE_CLANG_TIDY "Enable clang-tidy source code check" OFF)
cmake_dependent_option(
  ENABLE_CLANG_TIDY_AUTOFIX
  "Allow clang-tidy to automatically correct source code. Requires ENABLE_CLANG_TIDY begin ON" OFF
  "ENABLE_CLANG_TIDY" OFF)

if(ENABLE_CLANG_TIDY)
  set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
  find_program(CLANG_TIDY_BIN clang-tidy REQUIRED)

  cmessage(STATUS "Build with enabled clang-tidy(${CLANG_TIDY_BIN}) checks")

  set(HEADERS "src/|tests/")
  set(CLANG_TIDY_CMD ${CLANG_TIDY_BIN} --header-filter=${HEADERS} -p=${CMAKE_BINARY_DIR})

  if(ENABLE_CLANG_TIDY_AUTOFIX)
    cmessage(STATUS "clang-tidy will try to correct found issues")
    set(CLANG_TIDY_CMD ${CLANG_TIDY_CMD} -fix)
  endif()

  set(CMAKE_CXX_CLANG_TIDY ${CLANG_TIDY_CMD})
  set(CMAKE_C_CLANG_TIDY ${CLANG_TIDY_CMD})
endif()
