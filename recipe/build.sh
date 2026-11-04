#!/bin/bash

# Set-up the shell to behave more like a general-purpose programming language
set -euo pipefail
export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

# Configure project
cmake ${CMAKE_ARGS} --fresh -G Ninja -D CMAKE_BUILD_TYPE=Release -B build/azure -S .

# Build
cmake --build build/azure --target khiopsdriver_file_azure

# Copy binary to conda package
cmake --install build/azure --prefix $PREFIX
