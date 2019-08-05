include_guard()

set(module_name cmake-template.app)
set(module_library ${module_name}_lib)

set(module_library_sources
    ${CMAKE_CURRENT_SOURCE_DIR}/PrimesAccumulator.cpp
)

add_library(${module_library} ${module_library_sources})

target_link_libraries(${module_library}
    PRIVATE
        Primes::primes
        Boost::boost
)

target_include_directories(${module_library} INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

set(main_source_file
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

add_executable(${module_name} ${main_source_file})

target_link_libraries(${module_name}
    PRIVATE
        ${module_library}
        Primes::primes
)
