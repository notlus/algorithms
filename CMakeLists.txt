cmake_minimum_required(VERSION 3.14.0)
project(sorting VERSION 0.1.0)

set(CMAKE_CXX_STANDARD 14)

add_executable(partition 
    helpers.cpp
    partition.cpp
)

add_executable(mergesort
    helpers.cpp
    mergesort.cpp    
)