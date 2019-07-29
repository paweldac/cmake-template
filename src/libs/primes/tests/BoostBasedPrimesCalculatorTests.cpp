#include <gtest/gtest.h>
#include <boost/math/special_functions/prime.hpp>
#include "BoostBasedPrimesCalculator.hpp"
#include "First10000Primes.hpp"

using namespace testing;

struct BoostBasedPrimesCalculatorTests : Test {
  primes::BoostBasedPrimesCalculator sut;
  unsigned maxIndex = 10000;
};

TEST_F(BoostBasedPrimesCalculatorTests, WhenRequestedPrimeWithNegativePrimeIndex_ShouldThrowInvalidArgument)
{
  EXPECT_THROW(sut.getPrime(-1), std::invalid_argument);
}

TEST_F(BoostBasedPrimesCalculatorTests, WhenRequestedPrimeWithPrimeIndexEqToZero_ShouldThrowInvalidArgument)
{
  EXPECT_THROW(sut.getPrime(0), std::invalid_argument);
}

TEST_F(BoostBasedPrimesCalculatorTests, WhenRequestedPrimeWithPrimeIndexGraterThenLimit_ShouldThrowInvalidArgument)
{
  unsigned oneAboveMax = maxIndex + 1;
  EXPECT_THROW(sut.getPrime(oneAboveMax), std::invalid_argument);
}

TEST_F(BoostBasedPrimesCalculatorTests, shouldReturnNthPrimeNumber)
{
  auto sampleTestDataSize = first_10000_primes.size();
  for(std::size_t indexFromZero = 0, index = 1; indexFromZero < sampleTestDataSize; indexFromZero++, index++)
  {
    EXPECT_EQ(sut.getPrime(index), first_10000_primes[indexFromZero]);
  }
}


