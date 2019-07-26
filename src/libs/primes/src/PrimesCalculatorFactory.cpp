#include "primes/PrimesCalculatorFactory.hpp"
#include "BoostBasedPrimesCalculator.hpp"
#include <memory>

namespace primes {
        std::unique_ptr<PrimesCalculator> PrimesCalculatorFactory::create()
        {
            return std::make_unique<BoostBasedPrimesCalculator>();
        }
}
