# First of all

this is a example project to reproduce issue [gtest#4396](https://github.com/google/googletest/issues/4396).

there are two test in ./src/main.cpp:

- one run ASSERT_DEATH
- anthor run ASSERT_ANY_THROW

# reproduce

1. make
2. run ./build/Debug/bin/main

Output:

<details>

```console
[==========] Running 2 tests from 1 test suite.
[----------] Global test environment set-up.
[----------] 2 tests from DEAD_RS
[ RUN      ] DEAD_RS.dead
/Users/xxx/gtest_4396/src/main.cpp:16: Failure
Death test: test_assert(10)
    Result: threw an exception.
 Error msg:
[  DEATH   ] thread '<unnamed>' panicked at src/lib.rs:3:5:
[  DEATH   ] assertion failed: val > 20
[  DEATH   ] note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
[  DEATH   ]

[  FAILED  ] DEAD_RS.dead (1 ms)
[ RUN      ] DEAD_RS.exception
thread '<unnamed>' panicked at src/lib.rs:3:5:
assertion failed: val > 20
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
fatal runtime error: Rust panics must be rethrown
zsh: abort      ./build/Debug/bin/main
```
</details>

Both ASSERT_DEATH and ASSERT_ANY_THROW are failed.

# Solution

1. add the following to ./dead_rs/Cargo.toml:

    ```toml
    [profile.dev]
    panic = "abort"
    ```

2. make clean
3. make
4. run ./build/Debug/bin/main

Output:

<details>

```console
[==========] Running 2 tests from 1 test suite.
[----------] Global test environment set-up.
[----------] 2 tests from DEAD_RS
[ RUN      ] DEAD_RS.dead
[       OK ] DEAD_RS.dead (1 ms)
[ RUN      ] DEAD_RS.exception
thread '<unnamed>' panicked at src/lib.rs:3:5:
assertion failed: val > 20
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
zsh: abort      ./build/Debug/bin/main
```

</details>

The ASSERT_DEATH passed and the EXPECT_ANY_THROW failed.
