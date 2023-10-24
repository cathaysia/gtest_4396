#include <assert.h>
#include <gtest/gtest.h>
#include <stdlib.h>

extern "C" {
#include "dead_rs.h"
}

int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}

TEST(DEAD_RS, dead) {
  //
  ASSERT_DEATH(test_assert(10), "");
}

TEST(DEAD_RS, exception) {
  //
  EXPECT_ANY_THROW(test_assert(10));
}
