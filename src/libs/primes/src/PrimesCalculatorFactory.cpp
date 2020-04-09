#include "primes/PrimesCalculatorFactory.hpp"

#include <memory>

#include "BoostBasedPrimesCalculator.hpp"

namespace primes {
std::unique_ptr<PrimesCalculator> PrimesCalculatorFactory::create() const {
  return std::make_unique<BoostBasedPrimesCalculator>();
}
}  // namespace primes
