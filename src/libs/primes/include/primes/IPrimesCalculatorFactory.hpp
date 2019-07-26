#ifndef PRIMES_IPRIMESCALCULATORFACTORY_HPP
#define PRIMES_IPRIMESCALCULATORFACTORY_HPP

#pragma once

#include <memory>

namespace primes {
    class PrimesCalculator;

    class IPrimesCalculatorFactory {
    public:
        virtual ~IPrimesCalculatorFactory() = default;
        virtual std::unique_ptr<PrimesCalculator> create() = 0;
    };
}

#endif
