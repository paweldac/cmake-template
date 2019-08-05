#include "PrimesAccumulator.hpp"
#include "primes/PrimesCalculator.hpp"
#include <boost/throw_exception.hpp>
#include <stdexcept>
#include <string>

namespace {
    auto createNegativeArgumentExplanation(int passedArgument)
    {
        return std::string{"Number of primes to sum must be positive integer. Got "} + std::to_string(passedArgument);
    }
}

namespace adder {
  PrimesAccumulator::PrimesAccumulator(const primes::PrimesCalculator& primesCalculator_)
  : primesCalculator{primesCalculator_}
  {}

  unsigned PrimesAccumulator::sumNthPrimes(int numberOfPrimes) const
  {
    if(numberOfPrimes < 0)
    {
        BOOST_THROW_EXCEPTION(std::invalid_argument(createNegativeArgumentExplanation(numberOfPrimes)));
    }
    if(numberOfPrimes == 0)
    {
      return 0;
    }
    auto result = 0u;
    for(auto index = 1; index <= numberOfPrimes; index++)
    {
      result += primesCalculator.getPrime(index);
    }
    return result;
  }
}
