include_guard()

set(module_name PrimesAccumulator)

set(sources
    PrimesAccumulator.cpp
)

add_library(${module_name} ${sources})

target_link_libraries(${module_name}
    PRIVATE
        Primes::primes
        Boost::boost
)

target_include_directories(${module_name} INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})