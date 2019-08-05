#ifndef PRIMESCALCULATORMOCK_HPP
#define PRIMESCALCULATORMOCK_HPP

#pragma once

#include <gmock/gmock.h>
#include "primes/PrimesCalculator.hpp"

namespace mocks {
  struct PrimesCalculatorMock : primes::PrimesCalculator {
        MOCK_CONST_METHOD1(getPrime, unsigned(primes::PrimesCalculator::Index));
  };
}

#endif
