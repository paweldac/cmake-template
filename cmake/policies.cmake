include_guard()

# CMP0025: Compiler id for Apple Clang is now AppleClang.
# https://cmake.org/cmake/help/v3.17/policy/CMP0025.html
if(POLICY CMP0025)
  cmake_policy(SET CMP0025 NEW)
endif()

# CMP0092: Do not add MSVC warning flags to CMAKE_<LANG>_FLAGS by default.
# https://cmake.org/cmake/help/latest/policy/CMP0092.html
if(POLICY CMP0092)
  cmake_policy(SET CMP0092 NEW)
endif()

# CMP0167: Prefer Boost's package configuration files over the removed FindBoost module.
# https://cmake.org/cmake/help/latest/policy/CMP0167.html
if(POLICY CMP0167)
  cmake_policy(SET CMP0167 NEW)
endif()
