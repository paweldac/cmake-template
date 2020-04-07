include_guard()

#CMP0025: Compiler id for Apple Clang is now AppleClang.
#https://cmake.org/cmake/help/v3.17/policy/CMP0025.html
if (POLICY CMP0025)
  cmake_policy(SET CMP0025 NEW)
endif()
