include_guard()

set(MODULE_NAME primes)
set(LIBRARY_NAME primes)
set(LIBRARY_NAMESPACE Primes)

set(SOURCES
    src/BoostBasedPrimesCalculator.hpp
    src/BoostBasedPrimesCalculator.cpp
    src/PrimesCalculatorFactory.cpp
)

set(HEADERS
    include/primes/PrimesCalculator.hpp
    include/primes/PrimesCalculatorFactory.hpp
)

add_library(${MODULE_NAME} ${SOURCES} ${HEADERS})
add_library(${LIBRARY_NAMESPACE}::${LIBRARY_NAME} ALIAS ${MODULE_NAME})

target_include_directories(${MODULE_NAME}
    PUBLIC include
    PRIVATE src
)

target_link_libraries(${MODULE_NAME}
    PRIVATE
        Boost::headers
)

if(BUILD_TESTING)
    add_subdirectory(tests)
endif()
