#include "BoostBasedPrimesCalculator.hpp"

#include <boost/math/special_functions/prime.hpp>
#include <boost/throw_exception.hpp>

namespace {
  auto is_positive_integer(unsigned n)
  {
    return n >= 1;
  }

  auto createRangeError(unsigned actual)
  {
    return std::string{"Prime series index must be positive integer in range [1, 10000]. Got: "} + std::to_string(actual);
  }
}

namespace primes {
    unsigned BoostBasedPrimesCalculator::getPrime(PrimesCalculator::Index n) const {
        unsigned indexFromZero = n-1;
        if(not is_positive_integer(n) or indexFromZero >= boost::math::max_prime)
        {
          BOOST_THROW_EXCEPTION(std::invalid_argument(createRangeError(n)));
        }
        return boost::math::prime(indexFromZero); // boost::math calculates 1st prime at index 0.
    }
}
