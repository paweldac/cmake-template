#include "PrimesAccumulator.hpp"

#include <boost/throw_exception.hpp>
#include <sstream>
#include <stdexcept>
#include <string>

#include "primes/PrimesCalculator.hpp"
namespace {
auto createNegativeArgumentExplanation(int passedArgument) {
  std::stringstream ss;
  ss << "Number of primes to sum must be non-negative integer. Passed value: "
     << passedArgument;
  return ss.str();
}
}  // namespace

namespace adder {
PrimesAccumulator::PrimesAccumulator(
    const primes::PrimesCalculator& primesCalculator_)
    : primesCalculator{primesCalculator_} {}

unsigned PrimesAccumulator::sumNthPrimes(int numberOfPrimes) const {
  if (numberOfPrimes < 0) {
    BOOST_THROW_EXCEPTION(std::invalid_argument(
        createNegativeArgumentExplanation(numberOfPrimes)));
  }
  if (numberOfPrimes == 0) {
    return 0;
  }
  auto result = 0u;
  for (auto index = 1u; index <= unsigned(numberOfPrimes); index++) {
    result += primesCalculator.getPrime(index);
  }
  return result;
}
}  // namespace adder
