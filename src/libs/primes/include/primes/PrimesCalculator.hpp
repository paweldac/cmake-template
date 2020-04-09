#ifndef PRIMES_PRIMESCALCULATOR_HPP
#define PRIMES_PRIMESCALCULATOR_HPP

#pragma once

namespace primes {
class PrimesCalculator {
 public:
  using Index = unsigned;
  virtual ~PrimesCalculator() = default;
  virtual unsigned getPrime(Index) const = 0;
};
}  // namespace primes

#endif
