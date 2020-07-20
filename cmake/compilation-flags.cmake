include_guard()

add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang>:-stdlib=libc++>")

option(TREAT_WARNINGS_AS_ERRORS "Treat compilation warnings as errors" ON)
if(TREAT_WARNINGS_AS_ERRORS)
  add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-Werror>")
  add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,MSVC>:/WX>")
endif()

option(ENABLE_MORE_WARNINGS "Enable reasonable amount of warnigns" ON)
if(ENABLE_MORE_WARNINGS)
  add_compile_options(
    "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-Wall;-Wextra;-Wold-style-cast;-Wconversion;-Wdouble-promotion>"
  )

  add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wlogical-op;-Wuseless-cast;-Wshadow>")
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<VERSION_GREATER_EQUAL:$<CXX_COMPILER_VERSION>,6.0.0>>:-Wduplicated-cond;-Wnull-dereference>"
  )
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,GNU>,$<VERSION_GREATER_EQUAL:$<CXX_COMPILER_VERSION>,7.0.0>>:-Wduplicated-branches>"
  )

  add_compile_options(
    "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang>:-Wnull-dereference;-Wpointer-arith;-Wshadow-all;-Wconditional-uninitialized;-Wcast-align;-Wnon-virtual-dtor;-Wunused>"
  )
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,Clang>,$<VERSION_LESS:$<CXX_COMPILER_VERSION>,6.0.0>>:-Wno-missing-braces>"
  )
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,AppleClang>,$<VERSION_LESS:$<CXX_COMPILER_VERSION>,10.0.0>>:-Wno-missing-braces>"
  )

  add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,MSVC>:/Wall>")
endif()

option(ENABLE_PEDANTIC
       "Enable all the warnings demanded by strict ISO C and ISO C++ - Clang/GNU only" ON)
if(ENABLE_PEDANTIC)
  add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-Wpedantic>")
  if(TREAT_WARNINGS_AS_ERRORS)
    add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-pedantic-errors>")
  endif()
endif()

option(ENABLE_THREAD_SAFTY_WARNINGS "Enable additional thread safty compiler warnigns - Clang only"
       ON)
if(ENABLE_MORE_WARNINGS)
  add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang>:-Wthread-safety-analysis>")
endif()

if(NOT CMAKE_CONFIGURATION_TYPES)
  # https://cmake.org/cmake/help/latest/variable/CMAKE_CONFIGURATION_TYPES.html Debug
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>,$<CONFIG:Debug>>:-O0;-ggdb;-g>")
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,MSVC>,$<CONFIG:Debug>>:/MDd;/Zi;/Ob0;/Od;/RTC1>")
  # Release
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>,$<CONFIG:Release>>:-O3;-DNDEBUG>")
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,MSVC>,$<CONFIG:Release>>:/MD;/O2;/Ob2;/DNDEBUG>")
  # RelWithDebInfo
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>,$<CONFIG:RelWithDebInfo>>:-O2;-ggdb;-g>"
  )
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,MSVC>,$<CONFIG:RelWithDebInfo>>:/MD;/Zi;/O2;/Ob1;/DNDEBUG>")
  # MinSizeRel
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>,$<CONFIG:MinSizeRel>>:-Os;-DNDEBUG>")
  add_compile_options(
    "$<$<AND:$<COMPILE_LANG_AND_ID:CXX,MSVC>,$<CONFIG:MinSizeRel>>:/MD;/O1;/Ob1;/DNDEBUG>")
endif()
