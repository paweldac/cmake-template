#ifndef PRIMESACCUMULATOR_HPP
#define PRIMESACCUMULATOR_HPP

#pragma once

namespace primes {
class PrimesCalculator;
}

namespace adder {
class PrimesAccumulator {
 public:
  PrimesAccumulator(const primes::PrimesCalculator&);
  unsigned sumNthPrimes(int) const;

 private:
  const primes::PrimesCalculator& primesCalculator;
};
}  // namespace adder

#endif
