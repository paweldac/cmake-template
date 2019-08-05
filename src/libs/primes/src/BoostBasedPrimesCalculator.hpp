#ifndef PRIMES_BOOSTBASEDPRIMESCALCULATOR_HPP
#define PRIMES_BOOSTBASEDPRIMESCALCULATOR_HPP

#pragma once

#include "primes/PrimesCalculator.hpp"

namespace primes {
    class BoostBasedPrimesCalculator : public PrimesCalculator {
    public:
        unsigned getPrime(PrimesCalculator::Index) const override;
    };
}

#endif
