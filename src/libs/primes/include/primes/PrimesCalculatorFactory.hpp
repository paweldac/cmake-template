#ifndef PRIMES_PRIMESCALCULATORFACTORY_HPP
#define PRIMES_PRIMESCALCULATORFACTORY_HPP

#pragma once

#include "primes/IPrimesCalculatorFactory.hpp"

namespace primes {
class PrimesCalculator;
class PrimesCalculatorFactory : public IPrimesCalculatorFactory {
 public:
  std::unique_ptr<PrimesCalculator> create() const override;
};
}  // namespace primes

#endif
