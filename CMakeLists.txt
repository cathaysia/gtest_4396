cmake_minimum_required(VERSION 3.16)
project(ffi_example)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")

include_directories(./dead_rs/include/)
link_directories(./dead_rs/target/${CMAKE_BUILD_TYPE}/)

enable_testing()

add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/extern/googletest")
include(GoogleTest)

link_libraries(gmock dead_rs)

add_executable(main ./src/main.cpp)
gtest_discover_tests(main)
