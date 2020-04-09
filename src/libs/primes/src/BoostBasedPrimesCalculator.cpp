#include "BoostBasedPrimesCalculator.hpp"

#include <boost/math/special_functions/prime.hpp>
#include <boost/throw_exception.hpp>
#include <sstream>
#include <stdexcept>
#include <string>

namespace {
static constexpr primes::PrimesCalculator::Index minIndex = 1;
static constexpr primes::PrimesCalculator::Index maxIndex = 10000;
auto is_index_in_allowed_range(primes::PrimesCalculator::Index n) {
  return n >= minIndex && n <= maxIndex;
}

auto createIndexNotInRangeExplanation(primes::PrimesCalculator::Index actual) {
  std::stringstream ss;
  ss << "PrimesCalculator::Index index must be in range [" << minIndex << ", "
     << maxIndex << "]. Value passed: " << actual << ".";
  return ss.str();
}
}  // namespace

namespace primes {
unsigned BoostBasedPrimesCalculator::getPrime(PrimesCalculator::Index n) const {
  if (not is_index_in_allowed_range(n)) {
    BOOST_THROW_EXCEPTION(
        std::invalid_argument(createIndexNotInRangeExplanation(n)));
  }
  auto indexFromZero = n - 1u;  // boost::math calculates 1st prime at index 0.
  return boost::math::prime(indexFromZero);
}
}  // namespace primes
