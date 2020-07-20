include_guard()

add_subdirectory(mocks)

add_test_executable(
  ${PROJECT_NAME}.ut
  SOURCES ut.cpp
  DEPENDS PrimesCalculatorMocks
  META_TARGETS ${PROJECT_NAME}.tests)

add_test_executable(
  PrimesAccumulator.ut
  SUT PrimesAccumulator
  SOURCES PrimesAccumulatorTests.cpp
  DEPENDS PrimesCalculatorMocks
  META_TARGETS ${PROJECT_NAME}.tests)
