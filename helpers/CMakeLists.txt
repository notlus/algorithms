add_library(helpers)

target_sources(helpers PUBLIC
    helpers.cpp
)

target_include_directories(helpers PUBLIC
    .
)