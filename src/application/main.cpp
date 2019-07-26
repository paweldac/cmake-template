#include <iostream>
#include <memory>
#include "primes/PrimesCalculatorFactory.hpp"
#include "primes/PrimesCalculator.hpp"

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
    return 0;
}
