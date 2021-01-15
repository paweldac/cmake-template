#include <gtest/gtest.h>

#include <boost/math/special_functions/prime.hpp>

#include "BoostBasedPrimesCalculator.hpp"
#include "First10000Primes.hpp"

// NOLINTNEXTLINE
using namespace testing;

struct BoostBasedPrimesCalculatorTests : Test {
  primes::BoostBasedPrimesCalculator sut;
  const unsigned maxIndex = 10000;
};

// NOLINTNEXTLINE
TEST_F(BoostBasedPrimesCalculatorTests,
       WhenRequestedPrimeWithPrimeIndexEqToZero_ShouldThrowInvalidArgument) {
  EXPECT_THROW(sut.getPrime(0), std::invalid_argument);
}

// NOLINTNEXTLINE
TEST_F(
    BoostBasedPrimesCalculatorTests,
    WhenRequestedPrimeWithPrimeIndexGraterThenLimit_ShouldThrowInvalidArgument) {
  unsigned oneAboveMax = maxIndex + 1;
  EXPECT_THROW(sut.getPrime(oneAboveMax), std::invalid_argument);
}

// NOLINTNEXTLINE
TEST_F(BoostBasedPrimesCalculatorTests, shouldReturnNthPrimeNumber) {
  auto sampleTestDataSize = first10000Primes.size();
  for (auto indexFromZero = 0u, index = 1u; indexFromZero < sampleTestDataSize;
       indexFromZero++, index++) {
    EXPECT_EQ(sut.getPrime(index), first10000Primes[indexFromZero]);
  }
}
