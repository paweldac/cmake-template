#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include "PrimesAccumulator.hpp"
#include "mocks/PrimesCalculatorMock.hpp"

// NOLINTNEXTLINE
using namespace testing;

struct PrimesAccumulatorTests : Test {
  StrictMock<mocks::PrimesCalculatorMock> primesCalculatorMock;
  adder::PrimesAccumulator sut{primesCalculatorMock};
};

// NOLINTNEXTLINE
TEST_F(PrimesAccumulatorTests,
       WhenPassedNegativeValueAsFirstNthPrimes_ShouldThrowInvalidArgument) {
  EXPECT_THROW(sut.sumNthPrimes(-1), std::invalid_argument);
}

// NOLINTNEXTLINE
TEST_F(PrimesAccumulatorTests, WhenPassedZeroPrimesToSum_ResultShouldBeZero) {
  EXPECT_EQ(sut.sumNthPrimes(0), 0);
}

// NOLINTNEXTLINE
TEST_F(PrimesAccumulatorTests,
       WhenPassedNthPrimes_PrimesShouldBeTakenPrimesCalculatorAndAccumulated) {
  const auto firstPrime = 1u;
  const auto secondPrime = 2u;
  EXPECT_CALL(primesCalculatorMock, getPrime(1)).WillOnce(Return(firstPrime));
  EXPECT_CALL(primesCalculatorMock, getPrime(2)).WillOnce(Return(secondPrime));
  EXPECT_EQ(sut.sumNthPrimes(2), firstPrime + secondPrime);
}
