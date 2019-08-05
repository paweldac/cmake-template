#include <iostream>
#include <memory>
#include "primes/PrimesCalculatorFactory.hpp"
#include "primes/PrimesCalculator.hpp"
#include "PrimesAccumulator/PrimesAccumulator.hpp"

std::unique_ptr<primes::IPrimesCalculatorFactory> createPrimesCalculatorFactory()
{
    return std::make_unique<primes::PrimesCalculatorFactory>();
}

int main()
{
    auto primesCalculatorFactory = createPrimesCalculatorFactory();
    auto primesCalculator = primesCalculatorFactory->create();
    std::cout << "Primes: " << std::endl;
	for(int i=1; i<10; i++) {
      std::cout << i << ": " << primesCalculator->getPrime(i) << std::endl;
    }
    std::cout << "Sum of first 5 primes: " << adder::PrimesAccumulator{*primesCalculator}.sumNthPrimes(5) << std::endl;
    return 0;
}
