include_guard()

set(MODULE_NAME_TESTS ${MODULE_NAME}.ut)

add_test_executable(
  ${MODULE_NAME_TESTS}
  SUT Primes::primes
  SOURCES BoostBasedPrimesCalculatorTests.cpp
  DEPENDS Boost::headers
  META_TARGETS ${PROJECT_NAME}.tests)
