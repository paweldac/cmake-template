#include <iostream>
#include <memory>

#include "PrimesAccumulator/PrimesAccumulator.hpp"
#include "primes/PrimesCalculator.hpp"
#include "primes/PrimesCalculatorFactory.hpp"

std::unique_ptr<primes::IPrimesCalculatorFactory>
createPrimesCalculatorFactory() {
  return std::make_unique<primes::PrimesCalculatorFactory>();
}

int main() {
  auto primesCalculatorFactory = createPrimesCalculatorFactory();
  auto primesCalculator = primesCalculatorFactory->create();
  std::cout << "Primes: " << std::endl;
  const auto limit = 10u;
  for (auto i = 1u; i < limit; i++) {
    std::cout << i << ": " << primesCalculator->getPrime(i) << std::endl;
  }
  const auto primeNumIndex = 5;
  std::cout << "Sum of first 5 primes: "
            << adder::PrimesAccumulator{*primesCalculator}.sumNthPrimes(
                   primeNumIndex)
            << std::endl;
  return 0;
}
