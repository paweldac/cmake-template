#include <gtest/gtest.h>

struct DummyUT : testing::Test {
  DummyUT() = default;
  ~DummyUT() = default;
};

TEST_F(DummyUT, checkIfFalseIsNotTrue) { EXPECT_TRUE(false != true); }

TEST_F(DummyUT, checkIfTrueIsNotFalse) { EXPECT_TRUE(true != false); }
