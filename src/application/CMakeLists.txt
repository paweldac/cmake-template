include_guard()

set(module_name cmake-template.app)

set(sources
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

add_executable(${module_name} ${sources})

target_link_libraries(${module_name}
    PRIVATE
        Primes::primes
)
