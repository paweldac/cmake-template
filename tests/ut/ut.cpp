#include <gtest/gtest.h>

struct DummyUT : testing::Test {
  DummyUT() = default;
  ~DummyUT() override = default;
};

// NOLINTNEXTLINE
TEST_F(DummyUT, checkIfFalseIsNotTrue) { EXPECT_TRUE(false != true); }

// NOLINTNEXTLINE
TEST_F(DummyUT, checkIfTrueIsNotFalse) { EXPECT_TRUE(true != false); }
