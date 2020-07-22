include_guard()

include(colorful-message)

set(VALGRIND "Valgrind")
set(ASAN "AddressSanitizer")
set(TSAN "ThreadSanitizer")
set(LSAN "LeakSanitizer")
set(MSAN "MemorySanitizer")
set(UBSAN "UndefinedBehaviorSanitizer")

if(NOT MEMORY_SANITIZER)
  set(MEMORY_SANITIZER
      "None"
      CACHE
        STRING
        "Memory sanitizer for build, choose from ${VALGRIND}, ${ASAN}, ${TSAN}, ${LSAN}, ${MSAN}, ${UBSAN} and None"
        FORCE)

  set_property(
    CACHE MEMORY_SANITIZER
    PROPERTY STRINGS
             ${VALGRIND}
             ${ASAN}
             ${TSAN}
             ${LSAN}
             ${MSAN}
             ${UBSAN}
             "None")
endif()

if(${MEMORY_SANITIZER} MATCHES ${VALGRIND})
  find_program(MEMORYCHECK_COMMAND valgrind REQUIRED)
  set(MEMORYCHECK_TYPE Valgrind)
  set(MEMORYCHECK_COMMAND_OPTIONS
      "--leak-check=full --show-leak-kinds=all --track-origins=yes --trace-children=yes --verbose --error-exitcode=1"
  )
endif()

if(${MEMORY_SANITIZER} MATCHES ${ASAN})
  set(MEMORYCHECK_TYPE AddressSanitizer)
  set(MEMORYCHECK_SANITIZER_OPTIONS
      "verbosity=1:fast_unwind_on_malloc=0:strict_string_checks=1:detect_stack_use_after_return=1:check_initialization_order=1:strict_init_order=1"
  )
  add_compile_options(
    "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-fsanitize=address;-fno-omit-frame-pointer;-fsanitize-address-use-after-scope;-fstack-protector-all>"
  )
  add_link_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-fsanitize=address>")
endif()

if(${MEMORY_SANITIZER} MATCHES ${TSAN})
  set(MEMORYCHECK_TYPE ThreadSanitizer)
  set(MEMORYCHECK_SANITIZER_OPTIONS "verbosity=1:history_size=7")
  add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-fsanitize=thread;>")
  add_link_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-fsanitize=thread>")
endif()

if(${MEMORY_SANITIZER} MATCHES ${LSAN})
  set(MEMORYCHECK_TYPE LeakSanitizer)
  set(MEMORYCHECK_SANITIZER_OPTIONS "verbosity=1")
  add_compile_options(
    "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-fsanitize=leak;-fno-omit-frame-pointer;-fstack-protector-all>"
  )
  add_link_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-fsanitize=leak>")
endif()

if(${MEMORY_SANITIZER} MATCHES ${MSAN})
  if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
    set(MEMORYCHECK_TYPE MemorySanitizer)
    set(MEMORYCHECK_SANITIZER_OPTIONS "verbosity=1:poison_in_dtor=1:history_size=7")
    add_compile_options(
      "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang>:-fsanitize=memory;-fsanitize-memory-use-after-dtor;-fsanitize-memory-track-origins;-fno-omit-frame-pointer>"
    )
    add_link_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang>:-fsanitize=memory>")
  else()
    cmessage(
      NOTICE
      "MemorySanitizer cannot be enabled. Compiler(${CMAKE_CXX_COMPILER_ID}) doesn't support `-fsanitize=memory`"
    )
    set(${MEMORY_SANITIZER} "None")
  endif()
endif()

if(${MEMORY_SANITIZER} MATCHES ${UBSAN})
  set(MEMORYCHECK_TYPE UndefinedBehaviorSanitizer)
  set(MEMORYCHECK_SANITIZER_OPTIONS "verbosity=1:print_stacktrace=1")
  add_compile_options(
    "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-fsanitize=undefined;-fsanitize=float-divide-by-zero>"
  )
  add_compile_options("$<$<COMPILE_LANG_AND_ID:CXX,GNU>:-fsanitize=float-cast-overflow>")
  add_compile_options(
    "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang>:-fsanitize=unsigned-integer-overflow;-fsanitize=implicit-conversion;-fsanitize=local-bounds;-fsanitize=nullability>"
  )
  add_link_options("$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang,GNU>:-fsanitize=undefined>")
endif()

if(NOT ${MEMORY_SANITIZER} MATCHES "None")
  cmessage(STATUS "Build with enabled sanitizer: ${MEMORY_SANITIZER}")
else()
  cmessage(STATUS "Sanitizers are disabled in build")
endif()
