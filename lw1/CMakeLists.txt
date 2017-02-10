cmake_minimum_required(VERSION 3.6)
project(lw1)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES main.cpp lib/CSVparser-master/CSVparser.cpp lib/CSVparser-master/CSVparser.hpp database/CDatabaseConsoleProgram.cpp database/CDatabaseConsoleProgram.h)
add_executable(lw1 ${SOURCE_FILES})

project(lw1_testing)

add_subdirectory(lib/googletest-master)
include_directories(lib/googletest-master/googletest/include)
include_directories(lib/googletest-master/googlemock/include)

add_subdirectory(lib/CSVparser-master)

set(SOURCE_FILES lib/CSVparser-master/CSVparser.cpp lib/CSVparser-master/CSVparser.hpp tests/tests.cpp tests/tests.h database/CDatabaseConsoleProgram.cpp database/CDatabaseConsoleProgram.h)
add_executable(lw1_testing ${SOURCE_FILES})
target_link_libraries(lw1_testing gtest gtest_main )