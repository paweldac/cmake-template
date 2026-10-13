# [WIP]cmake-template [![CI](https://github.com/paweldac/cmake-template/actions/workflows/ci.yml/badge.svg)](https://github.com/paweldac/cmake-template/actions/workflows/ci.yml)

CMake template for C++ projects with Boost and Google Test integration.

## Build locally

Requirements: CMake 3.21 or newer, Ninja, and a vcpkg checkout matching the
`builtin-baseline` in `vcpkg.json`. Set `PROJECT_VCPKG_ROOT` to that checkout,
then run:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

Use the `release` preset for an optimized build. Dependencies are restored from
the pinned vcpkg manifest during CMake configuration.
