include_guard()

add_subdirectory(PrimesAccumulator)

set(module_name cmake-template.app)

set(sources main.cpp)

add_executable(${module_name} ${sources})

target_link_libraries(${module_name} PRIVATE PrimesAccumulator Primes::primes)
